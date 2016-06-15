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

## Function for making homogeneous zones out of heterogenous MZ raster.
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
#   Stops script and gives a message
#
# Returns:
#   A list of 4, with the Homogenized raster in [[2]].
#   The amount of Management Zones equals the amount of elements.

#rm(list = ls())  # Clear the workspace!
#ls() ## no objects left in the workspace
#start.time = Sys.time()


# INTO THE FUNCTION
HomogeniseRaster = function(x, window_type, min_ar)
{
  if (nbands(x) > 1)
  {
    stop(paste("Input", (data.class(x)), "is not single-banded."))
  }
  if (window_type == "circle")
  {
      radius = sqrt(min_ar * 10000 / 3.14)
      cf = focalWeight(x, radius, type = "circle")
      new_raster = focal(x, w=cf, fun = modal, na.rm = T)
      return(new_raster)
  }
  
}

#in_raster = raster(file.path("..", ".." , "output", "Zones_PC5.gri"))
#HomogeniseRaster = HomogeniseRaster(in_raster, "circle", 0.5)
#in_raster = raster("Zones_PC10.grd")

#spplot(ClassifiedZones)
#spplot(HomogeniseRaster)
