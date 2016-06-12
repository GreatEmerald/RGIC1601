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

# Argument: 
#	exportdata: Either SpatialPolygonsDataFrame or SpatialPointsDataFrame
#	filename: the directory of output
#
# Maintains:
#   Environment
#   Input files
#
# On violation:
#   Stops script
#
# Return:
#	None
#


## Export vector to kml
''' 
input:
    SpatialPolygonsDataFrame
output:
    kml files
'''
ExportPolygon = function(polygon.df, dir, filename, prj_string = CRS("+proj=longlat +datum=WGS84"))
	{
	polygon84 = spTransform(polygon.df, prj_string)

	# Delete extra "/" at the end of directory
	if (substr(dir,nchar(dir),nchar(dir)) == "/")
		{
		dir = substr(dir,1,nchar(dir)-1) 
		}
		file_path = file.path(dir,paste(filename,".gpx",sep = ""))
		
	writeOGR(polygon84,dsn = file_path,layer = filename, driver="KML", overwrite_layer=TRUE)
	}

	'# test code bigin
	dir = "/home/yi/Documents/RGIC01/backend/data/"
	polygon.df = polygons.df
	filename = "mypolygon"
	ExportPolygon(polygon.df,dir,filename)
	# test code over'




	
## Export points to GPX
'''
input:
    SpatialPointsDataFrame
output:
    GPX
	'''

ExportPoints = function(point.df, dir, filename, prj_string = CRS("+proj=longlat + ellps=WGS84"))
{
	# The projection of GPX have to be geographic coordinates instead of projected coordinates.
	points84 = spTransform(points.df, prj_string)

	# Delete extra "/" at the end of directory
	if (substr(dir,nchar(dir),nchar(dir)) == "/")
		{
		dir = substr(dir,1,nchar(dir)-1) 
		}
		file_path = file.path(dir,paste(filename,".gpx",sep = ""))
		
	writeOGR(points84,dsn = file_path, layer = filename, driver="GPX", overwrite_layer = TRUE,layer_options="GPX_USE_EXTENSIONS=YES" )
	}

	'# test code bigin
	dir = "/home/yi/Documents/RGIC01/backend/data/"
	point.df = points.df
	filename = "waypoint8"
	ExportPoints(point.df,dir,filename)
# test code over'


ExporttoFile= function(obj,dir,filename){
	if (class(obj)== "SpatialPolygonsDataFrame")
		{ExportPolygon(obj,dir,filename)}

	if (class(obj) == "SpatialPointsDataFrame")
		{ExportPoints(obj,dir,filename)}
	else
		{stops : "Object should be 'SpatialPolygonsDataFrame' or 'SpatialPointsDataFrame' "}
		}

# ExporttoFile(point.df,dir,filename)









