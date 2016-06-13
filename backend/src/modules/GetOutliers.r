# Input handling module for the backend of the management zone generation tool
# Copyright (C) 2016 William Schuch
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

## Function for detecting outliers in a single band rater file, using GDAL
#
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
GetOutliers = function(rast_in, Q)
{
  if (nbands(rast_in) > 1)
  {
    stop(paste("Input", (data.class(rast_in)), "is not single-banded."))
  }
  UV = unique(rast_in)
  
  if (length(UV) > 20) # used for 'Singe-band image'
  {
    quantiles = quantile(rast_in, c(Q,1-Q))
    Vec = rasterToPoints(rast_in, fun=function(x){x>quantiles[[2]] | x<quantiles[[1]]}, spatial=TRUE)
    #spplot(rast_in, sp.layout=list(Vec))
  
    sSp = as(Vec, "ppp")  # convert points to pp class
    Dens = density(sSp, adjust = 0.1)  # create density object
    Dsg = as(Dens, "SpatialGridDataFrame")  # convert to spatial grid class
    Dim = as.image.SpatialGridDataFrame(Dsg)  # convert again to an image
    Dcl = contourLines(Dim, nlevels = 8)  # create contour object - change 8 for more/fewer levels
    SLDF = ContourLines2SLDF(Dcl)  # convert to SpatialLinesDataFrame
    Polyclust = gPolygonize(SLDF[5, ])
    gas = gArea(Polyclust, byid = T)/10000
    Polyclust = SpatialPolygonsDataFrame(Polyclust, data = data.frame(gas), match.ID = F)
    centroids = getSpPPolygonsLabptSlots(Polyclust)
    centroidsDF = as.data.frame(centroids)
    centroidsSPDF = SpatialPointsDataFrame(centroidsDF, data = data.frame(gas))
  
    return(list(rast_in, quantiles, Vec, Polyclust, centroidsSPDF, Dsg))
  }
  if (length(UV) <= 20) # used for 'Homogeneous MZ raster'
  {
    Vec_MZ2 = RasterToVector(rast_in[[2]])
    gas = gArea(Vec_MZ2, byid = T)/10000
    Polyclust = SpatialPolygonsDataFrame(Vec_MZ2, data = data.frame(gas), match.ID = F)
    
    #centroids = getSpPPolygonsLabptSlots(Polyclust)
    #centroidsDF = as.data.frame(centroids)
    #centroidsSPDF = SpatialPointsDataFrame(centroidsDF, data = data.frame(gas))
    
    #Dcl = contourLines(rast_in, nlevels = 1)  # create contour object - change 8 for more/fewer levels
    
    return(list(rast_in, Vec_MZ2, gas, Polyclust, centroidsSPDF))
  }
}
#GetOutl = GetOutliers(WS,0.005) # used for 'Singe-band image'
#GetOutl_MZ = GetOutliers(HomogeniseRaster[[2]],0.005) # used for 'Homogeneous MZ raster'
