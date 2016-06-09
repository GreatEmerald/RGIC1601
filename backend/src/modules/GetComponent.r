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
library(rgdal)

#### Classify an input raster into management zones ####

# Arguments:
#   Method:
#       K-Means
#   Object:
#       Raster brick
#       Single Band-Image
#   Number of zones:
#       A default number when there is no input
#   Additional argument: (recommended for saving memory space)
#       File name, raster object will be written on this file
#
# Maintains:
#   Environment
#   Input files
#
# On violation:
#   stop()
#
# Returns:
#   Raster object with management zones with file saved in the output directory 