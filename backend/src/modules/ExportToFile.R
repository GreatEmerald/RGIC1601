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
library(tools)

# Argument: 
#	Inputdata: Either SpatialPolygonsDataFrame or SpatialPointsDataFrame
#	filename: The directory and filename (with extention) of output or a list of filenames
#	Output format: kml,sql,shp,gpx
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


ExportToFile = function(spatial.df, filenames, prj_string = CRS("+proj=longlat +datum=WGS84")){
for (filename in filenames)
	{
	vector84 = spatial.df
	layer = basename(file_path_sans_ext(filename))
	if (file_ext(filename)=="kml"){
		drv = "KML"
		vector84 = spTransform(spatial.df, prj_string)
		}
		
	if (file_ext(filename)=="sql"){
		drv = "PGDump"
		}

	if (file_ext(filename)=="shp"){
		drv = "ESRI Shapefile"
		}

	if (file_ext(filename)=="gpx"){
		drv = "GPX"
		vector84 = spTransform(spatial.df, prj_string)
		for (i in 1:(length(vector84)))
			{
			if (names(vector84@data[1]) !="id"){
			vector84@data[i] = NULL}
			}
		names(vector84)[names(vector84) == "id"] = "name"
		}

# If the projection will specified to other projection
	if (prj_string != CRS("+proj=longlat +datum=WGS84")){
		vector84 = spTransform(spatial.df, prj_string)
		}
		
	writeOGR(vector84,dsn = filename ,layer = layer, driver=drv, overwrite_layer=TRUE)
	}}


# test begin
#	obj = vec[[1]]
#	obj = points.df
# filename = "/home/yi/Documents/RGIC01/backend/data/onelayer2.kml"
# ExportToFile(obj,filename)
# test over










