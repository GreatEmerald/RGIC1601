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
  # if (length(UV) <= 20) # used for 'Heterogeneous MZ raster'
  # {
  #   Vec_MZ2 = RasterToVector(rast_in[[2]])
  #   gas = gArea(Vec_MZ2, byid = T)/10000
  #   Polyclust = SpatialPolygonsDataFrame(Vec_MZ2, data = data.frame(gas), match.ID = F)
  #   
  #   #centroids = getSpPPolygonsLabptSlots(Polyclust)
  #   #centroidsDF = as.data.frame(centroids)
  #   #centroidsSPDF = SpatialPointsDataFrame(centroidsDF, data = data.frame(gas))
  #   
  #   #Dcl = contourLines(rast_in, nlevels = 1)  # create contour object - change 8 for more/fewer levels
  #   
  #   return(list(rast_in, Vec_MZ2, gas, Polyclust, centroidsSPDF))
  # }
}
# GetOutl = GetOutliers(WS,0.0005) # used for 'Singe-band image'
# GetOutl_MZ = GetOutliers(Zones_PC5[[2]],0.005) # used for 'Homogeneous MZ raster'
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
