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
HomogeniseRaster = function(rast_in, F)
{
  if (nbands(rast_in) > 1)
  {
    stop(paste("Input", (data.class(rast_in)), "is not single-banded."))
  }
  Uni = unique(rast_in)
  Agg = aggregate(rast_in, fact = F, fun=modal, na.rm = TRUE)
  Uni_Agg = unique(Agg)

  return(list(rast_in, Agg, Uni, Uni_Agg))
}

#HomogeniseRaster = HomogeniseRaster(ClassifiedZones, 5)
#HomogeniseRaster[[2]]

#spplot(ClassifiedZones)
#spplot(HomogeniseRaster[[2]])