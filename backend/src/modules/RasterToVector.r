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

## Function for detecting unique values in a raster and converts these to polygons.
#
# Arguments:
#   rast_in:
#       character string: Homogenized Management Zone Raster.
#            Must be a format handled by GDAL.
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
#   The amount of Management Zones equals the amount of elements in the list.


# INTO THE FUNCTION
RasterToVector = function(rast_in)
{
  if (nbands(rast_in) != 1)
  {
    stop(paste("Input", (data.class(rast_in)), "is not single-banded."))
  }
  
  rast_in = aggregate(rast_in, fact=5, fun=modal)
  UV = unique(rast_in) # detect unique values / Management Zones
  MZs = seq(0, (length(UV)-1), by=1)
  MZs_vector = list(1:length(UV)) # create a list for the return

  RtP = rasterToPolygons(rast_in, dissolve=TRUE, na.rm=TRUE)
  
  oldmetadata = metadata(rast_in)
  #RtP@data$OldMetadata = append(oldmetadata, list(newvariable2="test2"))
  
  for (i in MZs)
  {
    if (i<4)
    {
      RtP@data$Metadata[[i+1]] = paste(
        "This is polygon", i, "out of", tail(MZs,1), "management zones (incl border).")
    }
  }
  
  return(RtP)
}
#in_raster = raster(file.path("..", ".." , "output", "PC5_Class3_HomoCir005.gri"))
#MZRasterToVector = RasterToVector(in_raster) #Homogeneous raster
#spplot(MZRasterToVector)

# #MZRasterToVector = RasterToVector(HomogeniseRaster[[2]]) # VI