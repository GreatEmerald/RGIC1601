# Input handling module for the backend of the management zone generation tool
# Copyright (C) 2016 Yi Xiong
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
library(sp)
library(rgdal)
library(raster)

### GetSamplingLocations ###
#
# This function return the central point coordinate of one raster object
# as spatial data point, or get certain amount sampling location each 
# management zone
#
# Arguments:
#   Input(raster object):
#     raster data
#   Method(character): 
#     "random"(default)
#   num_sample(numeric):
#     3(default) the number of samples per management zone
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



# Sampling location central of area
GetCentralSampleLoc <- function(Fieldraster){
  Zone_extent = extent(Fieldraster)
  central_x = Zone_extent@xmin +mean(Zone_extent@xmax-Zone_extent@xmin,1)
  central_y = Zone_extent@ymin +mean(Zone_extent@ymax-Zone_extent@ymin,1)
  return(c(central_x,central_y))
}

# Get random sampling locationn of multiple categories

GetMultipleSamplingLoc = function(obj, num_sample=3)
	{
	sample_matrix = c()
	id = (1:(num_sample * length(unique(obj))))
	for (i in 1:length(unique(obj)))
	{	
	Zone = obj
	Zone[Zone !=i] = NA
	sample_matrix= rbind(sample_matrix,sampleRandom(Zone, size=num_sample, na.rm=TRUE, ext=NULL,xy = T))
	}
	sample_matrix = cbind(sample_matrix,id)
	return (sample_matrix)
	}

### Return sampling number and coordinates

GetSamplingLocations <- function(Field_raster, Method = "random",num_sample=3)
  { 
  
  if (Method == "random"){
    Point_matrix = GetMultipleSamplingLoc(Field_raster,num_sample)
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
  # points.df@data$coords = cbind(coordinates(points.df)[,1],coordinates(points.df)[,2])


  # Add metadata
  points.df$sample_num = num_sample
  points.df$method = Method
  points.df$Notes = ""
  
  # A SpatialPointsDataFrame as return
  return(points.df)
  
}

# Test
#  source("/home/yi/Documents/RGIC/backend/src/modules/input.r")
#  Zones_dir = "/home/yi/Documents/RGIC/backend/data/Zone/homogenised.grd"
#  Zones = Input(Zones_dir)[[1]]
#  points.df = GetSamplingLocations(Zones)
#  spplot(Zones, sp.layout = list(points.df[2],col.regions = heat.colors(100)))
#  Values(Zone)
#  Test over
