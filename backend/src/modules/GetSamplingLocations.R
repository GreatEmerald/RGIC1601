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
library(raster)

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
#   One point with type of SpatialPointsDataFrame


### Get sampling location of one category
# Sampling location central of area
GetCentralSampleLoc <- function(Fieldraster){
  Zone_extent = extent(Fieldraster)
  central_x = Zone_extent@xmin +mean(Zone_extent@xmax-Zone_extent@xmin,1)
  central_y = Zone_extent@ymin +mean(Zone_extent@ymax-Zone_extent@ymin,1)
  return(c(central_x,central_y))
}

### Get sampling locationn of multiple categories

GetMultipleSamplingLoc = function(obj, num_sample=3, zones_count = 3)
	{
	sample_matrix = c()
	id = (1:(num_sample * zones_count))
	for (i in 1:zones_count)
	{
	Zone = obj
	Zone[Zone@data@values != i] = NA
	sample_matrix= rbind(sample_matrix,sampleRandom(Zone, size=num_sample, na.rm=TRUE, ext=NULL,xy = T))
	}
	sample_matrix = cbind(sample_matrix,id)
	return (sample_matrix)
	}

### Return sampling number and coordinates

GetSamplingLocations <- function(Field_raster, Method = "random",num_sample=3, zones_count = 3)
  { 
  
  if (Method == "random"){
    Point_matrix = GetMultipleSamplingLoc(Field_raster,num_sample,zones_count)
    }
  if (Method == "centre"){
    Point_matrix = c()
    Point = c(Zone_code, GetCentralSampleLoc(Field_raster))
    Point_matrix = rbind(Point_matrix,Point)
    }

  
  
  # transform to spatial points
  prj_string_WGS84 = CRS("+proj=utm +zone=31 +datum=WGS84 +units=m +no_defs +ellps=WGS84 +towgs84=0,0,0")
  points.df = as.data.frame(Point_matrix)
  names(points.df) = c("x","y","Zone_id","id")
  coordinates(points.df) <- ~x + y
  proj4string(points.df) <- prj_string_WGS84
#  points.df@data$coords = cbind(coordinates(points.df)[,1],coordinates(points.df)[,2])
  return(points.df)
    
}

# Test
# source(file.path("/home/yi/Documents/RGIC01/backend","src","modules","input.r"))
# Zones_dir = "/home/yi/Documents/RGIC01/backend/data/Zone/ClassifiedZones_kMeans_3zones.grd"
# Zones = Input(Zones_dir)[[1]]
# points.df = GetSamplingLocations(Zones,"random",num_sample=3, zones_count = 3)

# spplot(Zones)
