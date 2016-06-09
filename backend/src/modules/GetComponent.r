# Input handling module for the backend of the management zone generation tool
# Copyright (C) 2016 Geetika Rathee
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
library("RStoolbox")

#### Classify an input raster into management zones ####

# Arguments:
#   Object:
#       Raster brick
#   Additional argument: (recommended for saving memory space)
#       ?
#
# Maintains:
#   Environment
#   Input files
#
# On violation:
#   stop()
#
# Returns:
#   Raster single-band layer object; the layer will be the first principle component of the input brick

GetComponent = function(in_brick)
{
   in_data = getValues(in_brick)
   
   # scale=T save scaling applied to each variable, Center = T, save means that were subtracted, retx=F don't save PCA scores
   brick.pca = prcomp(na.omit(in_data), center = T, scale = T, retx = T)
   data.pca = predict(brick.pca, na.omit(in_data))
   
   out_raster = raster(in_brick)
   out_raster = setValues(data.pca[1])
   
   return(out_raster)
}

#GetComponent()