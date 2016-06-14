# Input handling module for the backend of the management zone generation tool
# Copyright (C) 2016 Dainius Masiliunas
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

## Function for importing spatial files into the backend, using GDAL
#
# Arguments:
#   filename:
#       character string: Raster file to use as input. Must be a format handled by GDAL.
#       character vector: Raster files to use as input, treated as bands of one file.
#           Must be a format handled by the raster package (which uses GDAL).
#
# Maintains:
#   Environment
#   Input files
#
# On violation:
#   Prints an error with stop()
#
# Returns:
#   A RasterStack if multiple files are specified, a RasterLayer if one is specified.

Input = function(filename, ...)
{
    for (file in filename)
        if (!file.exists(file))
            stop(paste("Input: No file(s) with the name", file))
    
    if (length(filename) > 1)
        return(stack(filename, ...))
    
    return(raster(filename, ...))
}
