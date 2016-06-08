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
#library(rgdal)

## Function for detecting outliers in a single band rater file, using GDAL
#
# Arguments:
#   filename:
#       character string: Raster file to use as input. Must be a format handled by GDAL.
#       character vector: Raster files to use as input, treated as bands of one file.
#           Must be a format handled by GDAL.
#
# Maintains:
#   Environment
#   Input files
#
# On violation:
#   Prints an error() and returns NA
#
# Returns:
#   A vector point file (.kml/.gjson),
#   with the outlier values stored in a separate field.

GetOutliers = function(filename = file.path("..", "data", "2016-04-03_bert_boerma_kale_grond_index_cumulative.tif"))
{
    for (file in filename)
    {
        if (!file.exists(file))
        {
            error(paste("Input: No file(s) with the name", file))
            return(NA)
        }
    }
    
#    if (length(filename) > 1)
#    {
#        RS = stack(filename)
#        return(brick(RS))
#    }
    
#    RB = brick(filename)
#    return(RB)
}
