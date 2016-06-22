# Input handling module for the backend of the management zone generation tool
# Copyright (C) 2016 William Schuch, Geetika Rathee
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

#### Required libraries ####
library(raster)
library(rgdal)
library(sp)
library(spatstat)
library(maptools)
library(rgeos)
library(igraph)
library(geosphere)

#### Function for detecting outliers in a single band rater file, using GDAL ####

# Arguments:
#   rast_in:
#       character string: RasterLayer to use as input. Must be a format handled by GDAL.
#       character vector: RasterLayer to use as input, single-band.
#           Must be a format handled by GDAL.
#   Q:
#       character string: Quantile for outlier. 
#
# Maintains:
#   (Environment)
#   Input files
#
# On violation:
#   Prints an error() and returns NA
#
# Returns:
#   A Formal Class SpatialPointsDataFrame,
#   with the outliers.


# INTO THE FUNCTION
GetOutliers = function(rast_in, Q, L)
{
  if (nbands(rast_in) > 1)
  {
    stop(paste("Input", (data.class(rast_in)), "is not single-banded."))
  }
  if (class(Q) != "numeric")
  {
    stop("Quantile value (Q) has to be a Numeric variable")
  }
  if (Q>1 | Q<0)
  {
    stop("Quantile value (Q) must be between 0 and 1.")
  }
  UV = unique(rast_in)
  
  if (length(UV) > 128) # used for 'Singe-band image'
  {
    quantiles = quantile(rast_in, c(Q,1-Q))
    PROJ = rast_in@crs@projargs
    
    Vec_upper = rasterToPoints(rast_in, fun=function(x){x>quantiles[[2]]}, spatial=TRUE)
    Vec_lower = rasterToPoints(rast_in, fun=function(x){x<quantiles[[1]]}, spatial=TRUE)
    
    sSp_upper = as(Vec_upper, "ppp")  # convert points to pp class
    sSp_lower = as(Vec_lower, "ppp")  
    
    Dens_upper = density(sSp_upper, adjust = 0.1)  # create density object
    Dens_lower = density(sSp_lower, adjust = 0.1) 
    
    Dsg_upper = as(Dens_upper, "SpatialGridDataFrame")  # convert to spatial grid class
    Dsg_lower = as(Dens_lower, "SpatialGridDataFrame")  
    
    Dim_upper = as.image.SpatialGridDataFrame(Dsg_upper)  # convert again to an image
    Dim_lower = as.image.SpatialGridDataFrame(Dsg_lower) 

    Dcl_upper = contourLines(Dim_upper, nlevels = L)  # create contour object - change 8 for more/fewer levels
    Dcl_lower = contourLines(Dim_lower, nlevels = L)

    SLDF_upper = ContourLines2SLDF(Dcl_upper, proj4string = CRS(PROJ))  # convert to SpatialLinesDataFrame
    SLDF_lower = ContourLines2SLDF(Dcl_lower, proj4string = CRS(PROJ))  
    
    Polyclust_upper = gPolygonize(SLDF_upper[-1, ])
    Polyclust_lower = gPolygonize(SLDF_lower[-1, ])

    for (z in seq(3, length(SLDF_upper), by=1))
    {
      Polyclust_upper = try(gPolygonize(SLDF_upper[z, ]))
      gas_upper = try(gArea(Polyclust_upper, byid = T)/10000)
      Polyclust_upper = try(SpatialPolygonsDataFrame(Polyclust_upper, data = data.frame(gas_upper), match.ID = F))
      
      if (data.class(gas_upper) == "numeric")
      {
        break
      }
    }
    
    for (z in seq(3, length(SLDF_lower), by=1))
    {
      Polyclust_lower = try(gPolygonize(SLDF_lower[z, ]))
      gas_lower = try(gArea(Polyclust_lower, byid = T)/10000)
      Polyclust_lower = try(SpatialPolygonsDataFrame(Polyclust_lower, data = data.frame(gas_lower), match.ID = F))
      
      if (data.class(gas_lower) == "numeric")
      {
        break
      }
    }
    
    #Polyclust_upper = gPolygonize(SLDF_upper[5, ])
    #Polyclust_lower = gPolygonize(SLDF_lower[5, ])
    
    #gas_upper = gArea(Polyclust_upper, byid = T)/10000
    #gas_lower = gArea(Polyclust_lower, byid = T)/10000

    #Polyclust_upper = SpatialPolygonsDataFrame(Polyclust_upper, data = data.frame(gas_upper), match.ID = F)
    #Polyclust_lower = SpatialPolygonsDataFrame(Polyclust_lower, data = data.frame(gas_lower), match.ID = F)
    
    rm(gas_upper, gas_lower, SLDF_upper,SLDF_lower,Dcl_upper,
       Dcl_lower, Dim_upper, Dim_lower, Dsg_upper, Dsg_lower, Dens_upper, Dens_lower, sSp_lower, sSp_upper)
    
    #centroids_upper = getSpPPolygonsLabptSlots(Polyclust_upper)
    #centroids_lower = getSpPPolygonsLabptSlots(Polyclust_lower)
    centroids_upper = centroid(Polyclust_upper) # no warning with "Use coordinates method"
    centroids_lower = centroid(Polyclust_lower)

    centroidsDF_upper = as.data.frame(centroids_upper)
    centroidsDF_lower = as.data.frame(centroids_lower)
    centroidsDF_lower["quantile"] = Q * 100
    centroidsDF_upper["quantile"] = (1 - Q) * 100
    centroidsDF_lower["extreme"] = "lower"
    centroidsDF_upper["extreme"] = "higher"
    centroidDF  = rbind(centroidsDF_lower, centroidsDF_upper)
    centroidDF["outlier_detection_method"] = "Quantile Method"
    xy = centroidDF[,c(1,2)]
    centroidDF <- SpatialPointsDataFrame(coords = xy, data = centroidDF, bbox = NULL,
                                   proj4string = CRS(PROJ))
    return(centroidDF)
    }
    else
    {
        stop("Check input file!")
    }
}

#outliers = GetOutliers(rast_in, Q, L)