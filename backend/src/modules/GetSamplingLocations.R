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


### GetSamplingLocations ###
#
# This function only return the central point coordinate of one raster object
# as spatial data point
#
# Arguments:
#   Input:
#     raster data
#   Method: 
#     "centre"(default)
#   Zone_code:
#     1(default)
#
# Maintains:
#   Environment
#   Input files
#
# On violation:
#   Stops script
#
# Returns:
#   Raster object with management zones with file saved in the output directory 





### load Raster zone map
Project_dir = "G:/Mater_years/P6_Integrated course/ACT/Coding/RGIC/backend"

filename = "2016-04-03_bert_boerma_kale_grond_index_cumulative.tif"
# test map
source(file.path(Project_dir,"src","modules","input.r"))
filename = "Test_area.tif"
Field_map_dir = file.path(Project_dir,"data",filename)
Field_raster = Input(Field_map_dir)[[1]]



### Get sampling location of one category
# Sampling location central of area
GetCentralSampleLoc <- function(Fieldraster){
  Zone_extent = extent(Zone_extent)
  central_x = sample(Zone_extent@xmax-Zone_extent@xmin)
  central_y = sample(Zone_extent@ymax-Zone_extent@ymin)
  return(c(central_x,central_y))
}

# Random Sampling location (didn't finish yet)
num_sample = 20
spsample(Zone_extent, num_sample, type="random" )

### Get sampling locationn of multiple categories




### Return sampling number and coordinates
GetSamplingLocations <- function(Input, Method = "centre", Zone_code = 1)
  {
  if (Method != "centre"){
    stop("try centre")
    }
    
    else{
    Point_matrix = c()
    point = c(Zone_code, GetCentralSampleLoc(Input))
    Point_matrix = rbind(Point_matrix,point)
    
    # transform to spatial points
    prj_string_WGS84 = CRS("+proj=utm +zone=31 +datum=WGS84 +units=m +no_defs +ellps=WGS84 +towgs84=0,0,0")
    points.df = as.data.frame(Point_matrix)
    names(points.df) = c("ZoneCode","x","y")
    coordinates(points.df) <- ~x + y
    proj4string(points.df) <- prj_string_WGS84
    
    return(points.df)
    }
}

# GetSamplingLocations(points.df)


