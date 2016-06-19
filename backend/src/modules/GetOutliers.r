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
#install.packages(c("nominatim", "raster", "rgdal", "sp", "spatstat", "maptools", "rgeos"))
#install.packages("igraph")
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


GetOutliers = function(rast_in, Q)
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
  
  if (length(UV) > 20) # used for 'Singe-band image'
  {
    quantiles = quantile(rast_in, c(Q,1-Q))
    #Vec = rasterToPoints(rast_in, fun=function(x){x>quantiles[[2]] | x<quantiles[[1]]}, spatial=TRUE)
    Vec_upper = rasterToPoints(rast_in, fun=function(x){x>quantiles[[2]]}, spatial=TRUE)
    Vec_lower = rasterToPoints(rast_in, fun=function(x){x<quantiles[[1]]}, spatial=TRUE)
    
    #sSp = as(Vec, "ppp")  # convert points to pp class
    sSp_upper = as(Vec_upper, "ppp")  # convert points to pp class
    sSp_lower = as(Vec_lower, "ppp")  # convert points to pp class
    
    #Dens = density(sSp, adjust = 0.1)  # create density object
    Dens_upper = density(sSp_upper, adjust = 0.1)  # create density object
    Dens_lower = density(sSp_lower, adjust = 0.1)  # create density object
    
    #Dsg = as(Dens, "SpatialGridDataFrame")  # convert to spatial grid class
    Dsg_upper = as(Dens_upper, "SpatialGridDataFrame")  # convert to spatial grid class
    Dsg_lower = as(Dens_lower, "SpatialGridDataFrame")  # convert to spatial grid class
    
    #Dim = as.image.SpatialGridDataFrame(Dsg)  # convert again to an image
    Dim_upper = as.image.SpatialGridDataFrame(Dsg_upper)  # convert again to an image
    Dim_lower = as.image.SpatialGridDataFrame(Dsg_lower)  # convert again to an image
    
    #Dcl = contourLines(Dim, nlevels = 8)  # create contour object - change 8 for more/fewer levels
    Dcl_upper = contourLines(Dim_upper, nlevels = 8)  # create contour object - change 8 for more/fewer levels
    Dcl_lower = contourLines(Dim_lower, nlevels = 8)  # create contour object - change 8 for more/fewer levels
    
    #SLDF = ContourLines2SLDF(Dcl)  # convert to SpatialLinesDataFrame
    SLDF_upper = ContourLines2SLDF(Dcl_upper)  # convert to SpatialLinesDataFrame
    SLDF_lower = ContourLines2SLDF(Dcl_lower)  # convert to SpatialLinesDataFrame
    
    #Polyclust = gPolygonize(SLDF[5, ])
    Polyclust_upper = gPolygonize(SLDF_upper[5, ])
    Polyclust_lower = gPolygonize(SLDF_lower[5, ])
    
    #gas = gArea(Polyclust, byid = T)/10000
    gas_upper = gArea(Polyclust_upper, byid = T)/10000
    gas_lower = gArea(Polyclust_lower, byid = T)/10000
    
    PROJ = rast_in@crs@projargs
    
    #Polyclust = SpatialPolygonsDataFrame(Polyclust, data = data.frame(gas), match.ID = F)
    Polyclust_upper = SpatialPolygonsDataFrame(Polyclust_upper, data = data.frame(gas_upper), match.ID = F)
    Polyclust_lower = SpatialPolygonsDataFrame(Polyclust_lower, data = data.frame(gas_lower), match.ID = F)
    
    print("After Polyclust_lower")
    
    #centroids = getSpPPolygonsLabptSlots(Polyclust)
    centroids_upper = getSpPPolygonsLabptSlots(Polyclust_upper)
    centroids_lower = getSpPPolygonsLabptSlots(Polyclust_lower)
    
    print("After centroids_lower")
    
    #centroidsDF = as.data.frame(centroids)
    centroidsDF_upper = as.data.frame(centroids_upper)
    centroidsDF_lower = as.data.frame(centroids_lower)
    
    print("After centroidsDF_lower")
    
    #centroidsSPDF = SpatialPointsDataFrame(centroidsDF, data = data.frame(gas))
    centroidsSPDF_upper = SpatialPointsDataFrame(centroidsDF_upper, data = data.frame(gas_upper))
    centroidsSPDF_lower = SpatialPointsDataFrame(centroidsDF_lower, data = data.frame(gas_lower))
    
    print("After centroidsSPDF_lower")
    
    # culculate mean
    WSmean = cellStats(rast_in,mean)
    
    tering = SpatialPointsDataFrame(list(centroidsSPDF_upper,centroidsSPDF_lower), data = data.frame(gas_lower))
    
    print("tering")
  
    return(list(rast_in, #input raster
                 Vec_upper,Vec_lower, #Up&Lo vectors
                 centroidsSPDF_upper,centroidsSPDF_lower, #Up&Lo centroids
                  Dcl_upper, Dcl_lower, #Up&Lo contour lines
                 Polyclust_upper, Polyclust_lower
                 ))
    
    #return(tering)
  }
}
# GetOutl = GetOutliers(WS,0.003) # used for 'Singe-band image'
# plot(GetOutl)
# 
# rv_pnt_up = list("sp.points", GetOutl[[2]], col = "red")
# rv_pnt_lo = list("sp.points", GetOutl[[3]], col = "green")
# rv_cent_up = list("sp.points", GetOutl[[4]], col = "yellow")
# rv_cent_lo = list("sp.points", GetOutl[[5]], col = "white")
# rv_pol_up = list("sp.polygons", GetOutl[[8]], fill = "white")
# rv_pol_lo = list("sp.polygons", GetOutl[[9]], fill = "white")
# 
# SPplotWS = spplot(GetOutl[[1]], scales = list(draw = TRUE),
#                   xlab = "X", ylab = "Y",
#                   ol.regions = rainbow(99, start=.1),
#                   sp.layout = list(rv_pnt_up,rv_pnt_lo))
# SPplotWS
# 
# spplot(GetOutl[[1]])
# spplot(GetOutl[[3]], add=TRUE)
# spplot(GetOutl[[4]])







# 
# spplot(Zones_PC5[[1]])
# unique(Zones_PC5)
# 
# subset(Zones_PC5, )
# SS_2 = subset(Zones_PC5, 2)
# 
# 
# # Detect unique values / Management Zones
# UV = unique(HomogeniseRaster[[2]])
# # Create a list for the return
# LWS = list(1:length(UV))
# 
# for (i in UV)
# {
#   RAST = raster(Zones_PC5)
#   LWS[[i]] = RAST
# }
# 
# 
# spplot(SS_2)
# 
# Clumpie = clump(Zones_PC5, direction=8, gaps=FALSE)
# freq(Clumpie)
# spplot(Clumpie)
# 
# r <- raster(ncols=12, nrows=12)
# r = Zones_PC5
# 
# r[] <- round(runif(ncell(r))*1 )
# rc <- clump(r) 
# freq(rc)
# spplot(r)
# 
# # get frequency table    
# f<-freq(Clumpie)
# # save frequency table as data frame
# f<-as.data.frame(f)
# 
# # which rows of the data.frame are only represented by clumps under 9pixels?
# str(which(f$count <= 9))
# # which values do these correspond to?
# str(f$value[which(f$count <= 9)])
# # put these into a vector of clump ID's to be removed
# excludeID <- f$value[which(f$count <= 9)]
# 
# # make a new raster to be sieved
# formaskSieve <- rc
# # assign NA to all clumps whose IDs are found in excludeID
# formaskSieve[rc %in% excludeID] <- NA
# 
# spplot(formaskSieve)
# 
# 
# # extend raster, otherwise left and right edges are 'touching'
# r <- extend(Zones_PC5, c(1,1))
# 
# # get al unique class values in the raster
# clVal <- unique(r)
# 
# # remove '0' (background)
# clVal <- clVal[!clVal==0]
# 
# # create a 1-value raster, to be filled in with NA's
# r.NA <- setValues(raster(r), 1)
# 
# # set background values to NA
# r.NA[r==0]<- NA
# 
# # loop over all unique class values
# for (i in clVal) {
#   
#   # create & fill in class raster
#   r.class <- setValues(raster(r), NA)
#   r.class[r == i]<- 1
#   
#   # clump class raster
#   clp <- clump(r.class)
#   
#   # calculate frequency of each clump/patch
#   cl.freq <- as.data.frame(freq(clp))
#   
#   # store clump ID's with frequency 1
#   rmID <- cl.freq$value[which(cl.freq$count == 1)]
#   
#   # assign NA to all clumps whose ID's have frequency 1
#   r.NA[clp %in% rmID] <- NA
# } 
# 
# # multiply original raster by the NA raster
# r <- r * r.NA
# 
# # crop the originally extended raster ((row 2-6 and column 2-6))
# r <- crop(r, extent(r, 2, 6, 2, 6 ))
# 
# getValues(r)
# 
# #  [1] NA  1 NA NA NA
# #       1  1  1 NA NA  
# #       1 NA  1 NA NA  
# #       2  1 NA  1 NA  
# #       2  2 NA NA NA
# 
