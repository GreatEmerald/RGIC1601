# Input handling module for the backend of the management zone generation tool
# Copyright (C) 2016 Yi Xiong
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
library(sp)
library(rgdal)
###
# 
#
#
#
#
#
#
#





### load Raster zone map
Project_dir = getwd()
Project_dir = file.path(Project_dir,"backend")
filename = "2016-04-03_bert_boerma_kale_grond_index_cumulative.tif"
# test map
filename = "Test_area.tif"
Field_map_dir = file.path(Project_dir,"data",filename)
Field_raster = Input(Field_map_dir)[[1]]
spplot(Field_raster)
source(file.path(Project_dir,"src","modules","input.r"))


### Get sampling location of one category
# Sampling location central of area
GetCentralSampleLoc <- function(Fieldraster){
  Zone_extent = extent(Zone_extent)
  central_x = mean(Zone_extent@xmin,Zone_extent@xmax)
  central_y = mean(Zone_extent@ymin,Zone_extent@ymax)
  return(c(central_x,central_y))
}

# testing
GetCentralSampleLoc(Field_raster)


# Random Sampling location (didn't finish yet)
num_sample = 20
spsample(Zone_extent, num_sample, type="random" )

### Get sampling locationn of multiple categories




### Return sampling number and coordinates 
Zone_code = 1
Point_matrix = c()
point = c(Zone_code, GetCentralSampleLoc(Field_raster))
Point_matrix = rbind(Point_matrix,point)


# transform to spatial points
prj_string_WGS84 = CRS("+proj=utm +zone=31 +datum=WGS84 +units=m +no_defs +ellps=WGS84 +towgs84=0,0,0")

points.df = as.data.frame(Point_matrix)

names(points.df) = c("ZoneCode","x","y")
coordinates(points.df) <- ~x + y
proj4string(points.df) <- prj_string_WGS84





