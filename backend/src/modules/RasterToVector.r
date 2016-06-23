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
library(rgeos)

#### Import module(s) ####
# These are runned from main.r, so mind the directory.
source("modules/util.r")

## Function for detecting unique values in a raster and converts these to polygons.
#
# Arguments:
#   MZrast_in:
#       character string: Homogenized Management Zone Raster.
#            Must be a format handled by GDAL.
#       character vector: RasterLayer to use as input, single-band.
#           Must be a format handled by GDAL.
#   VIrast_in:   
#       character string: OPTIONAL Vegetation index raster
#
# Maintains:
#   Environment
#   Input files
#
# On violation:
#   Stops script
#
# Returns:
#   A large list SpatialPolygonsDataFrame.
#   The amount of Management Zones equals the amount of elements in the list.
#   


RasterToVector = function(MZrast_in, VIrast_in=NA)
{
  if (class(MZrast_in) != "RasterLayer")
  {
    stop(paste("Input", (data.class(MZrast_in)), "is not a raster."))
  }
  
  if (nbands(MZrast_in) != 1)
  {
    stop(paste("Input", (data.class(MZrast_in)), "is not single-banded."))
  }
  
  #oldmetadata = metadata(MZrast_in)
  oldmetadata = metadata(MZrast_in)
  
  MZrast_in = aggregate(MZrast_in, fact=10, fun=modal)
  UV = unique(MZrast_in) # detect unique values / Management Zones
  MZs = seq(0, (length(UV)-1), by=1)
  MZs_vector = list(1:length(UV)) # create a list for the return
  
  RtP = gdal_polygonizeR(MZrast_in) # uses function from util.r
  RtP@data$zone_number = RtP@data$layer
  RtP@data$layer = NULL
  RtP = aggregate(RtP, by = "zone_number")

  for (i in MZs)
  {
    if (i < length(MZs))
    {
      RtP@data$Metadata[[i+1]] = paste(
         i, "out of", tail(MZs,1), "management zones.")
    }
  }
  
  testWS = RtP@data
  testWS2 = data.frame(testWS,oldmetadata)
  
  exist_col = ncol(RtP@data) # counts the existing columns
  #exist_col = 2
  
  for (i in seq(1,(length(oldmetadata)),by=1))
  {
    testWS[[paste(colnames(testWS2[i+exist_col]))]] = oldmetadata[[i]]
    RtP@data[[colnames(testWS2[i+exist_col])]] = oldmetadata[[i]]
  }
  
  if (data.class(VIrast_in) == "RasterLayer")
  {
    if (nbands(VIrast_in) != 1)
    {
      stop(paste("Input", (data.class(VIrast_in)), "is not single-banded."))
    }
    r = VIrast_in
    sdata = RtP
    r.vals = extract(r, sdata)
    r.mean = unlist(lapply(r.vals, FUN=mean, na.rm = TRUE))
    #r.mean = suppressWarnings(lapply(r.vals, FUN=mean))
    sdata@data$VImeans =  r.mean
    return(sdata)
  }
    else
    {
      # probably add some checks here
      return(RtP)
    }
}
#in_raster = raster(file.path("..", ".." , "output", "homogenised.gri"))
#in_VI = raster(file.path("..", ".." , "output", "Index_testfield_agg10.gri"))
#MZRasterToVector = RasterToVector(in_raster) #Homogeneous raster
MZRasterToVectorVI = RasterToVector(in_raster, in_VI) #Homogeneous raster
#spplot(MZRasterToVectorVI)


MZrast_in = in_raster
VIrast_in = in_VI
