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

## Function for detecting unique values in a raster and converts these to polygons.
#
# Arguments:
#   rast_in:
#       character string: Management Zone Raster. Must be a format handled by GDAL.
#       character vector: RasterLayer to use as input, single-band.
#           Must be a format handled by GDAL.
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
#   The amount of Management Zones equals the amount of elements.

#rm(list = ls())  # Clear the workspace!
#ls() ## no objects left in the workspace
#start.time = Sys.time()


# INTO THE FUNCTION
RasterToVector = function(rast_in)
{
  if (nbands(rast_in) > 1)
  {
    stop(paste("Input", (data.class(rast_in)), "is not single-banded."))
  }
  
  # Detect unique values / Management Zones
  UV = unique(rast_in)
  # Create a list for the return
  LWS = list(1:length(UV))
  
  for (i in UV)
  {
    SHAPE = rasterToPolygons(rast_in, fun=function(x){x == i}, dissolve=TRUE)
    LWS[[i]] = SHAPE
  }
 
  return(LWS)
}
#MZRasterToVector = RasterToVector(HomogeniseRaster[[2]])
#spplot(ClassifiedZones)

#spplot(MZRasterToVector[[1]])
