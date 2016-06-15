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
  if (nbands(rast_in) > 1)
  {
    stop(paste("Input", (data.class(rast_in)), "is not single-banded."))
  }
  
  # Detect unique values / Management Zones
  UV = unique(rast_in)
  # Create a list for the return
  MZs_vector = list(1:length(UV))
  
  oldmetadata = metadata(rast_in)
  #oldmetadata2 = append(oldmetadata, list(newvariable="test1"))
  
  SHAPE_SS = rasterToPolygons(rast_in, dissolve=TRUE)
  
  SHAPE_SS@data$Metadata = append(oldmetadata, list("test1"))

  #for (i in UV)
  #{
  #  SHAPE = rasterToPolygons(rast_in, fun=function(x){x == i}, dissolve=TRUE)
    #MZs_vector[[i]] = SHAPE
    
    #SHAPE_SS[[i]]@data["META"] = paste("This is polygon", i, "out of", tail(UV,1), "management zones.")
    #SHAPE_SS@data$Metadata[[i]] == paste("This is polygon", i, "out of", tail(UV,1), "management zones.")
  #  SHAPE2[[i]] = SHAPE
    #SHAPE2 = append(SHAPE)
  #}
  
  return(SHAPE_SS)
}

  
MZRasterToVector = RasterToVector(HomogeniseRaster) #Homogeneous raster
#MZRasterToVector = RasterToVector(HomogeniseRaster[[2]]) # VI

MZs_vectorr = cbind(MZRasterToVector[[1]], MZRasterToVector[[2]], MZRasterToVector[[3]], makeUniqueIDs = TRUE) 
MZs_vectorrr = rasterToPolygons(MZs_vectorr, fun=function(x){x==3}, dissolve=FALSE)

MZRasterToVector[1]["META"] = paste("Hello!")
MZRasterToVector@data$Metadata = list("test1")

L = (MZRasterToVector@data[1] == 3)

#spplot(HomogeniseRaster[[2]]) # plot input
#spplot(MZRasterToVector) # plot output (MZ1)
#spplot(MZRasterToVector[3]) # plot output (MZ3)



oldmetadata = metadata(MZRasterToVector[[1]])
oldmetadata2 = append(oldmetadata, list(newvariable="test1"))
newmetadata = append(oldmetadata2, list(newvariable2="test2"))
metadata(MZRasterToVector[[1]]) = newmetadata
