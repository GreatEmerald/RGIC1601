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
#	filenames: A list of filenamesThe or one filename including directory and filename extention of out put
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

## (delete exist file)



ExportToFile = function(spatial.df, filenames, prj_string = "+proj=longlat +datum=WGS84"){
if (class(filenames) != "character")
	{stop("filenames should be character")}


for (filename in filenames)
	{
	
	csr = CRS(prj_string)
	vector = spatial.df
	layer = basename(file_path_sans_ext(filename))
	if (!file_ext(filename) %in% c("kml","sql","gpx","shp"))
		{stop("The file extention should be 'kml','sql','gpx','shp'")}
		
	if (file_ext(filename)=="kml"){
		drv = "KML"
		vector = spTransform(spatial.df, prj_string)
		}
		
	if (file_ext(filename)=="sql"){
		drv = "PGDump"
		}

	if (file_ext(filename)=="shp"){
		if (file.exists(filename)) 
			{file.remove(paste(file_path_sans_ext(filename),".dbf",sep = ""))
			file.remove(paste(file_path_sans_ext(filename),".prj",sep = ""))
			file.remove(paste(file_path_sans_ext(filename),".shx",sep = ""))
			
			}
		drv = "ESRI Shapefile"
		}

	if (file_ext(filename)=="gpx"){
		drv = "GPX"
		vector = spTransform(spatial.df, prj_string)
		
		for (i in 1:(length(vector)))
			{
			if (names(vector@data[1]) !="id"){
			vector@data[i] = NULL}
			}
		names(vector)[names(vector) == "id"] = "name"
		}

# If the projection will specified to other projection
	if (prj_string != "+proj=longlat +datum=WGS84"){vector@data
		vector = spTransform(spatial.df, csr)
		}
	if (file.exists(filename)) 
			{file.remove(filename)}
	writeOGR(vector,dsn = filename ,layer = layer, driver=drv, overwrite_layer=TRUE)
	}}


# test begin
# 	obj = vec[[1]]
# 	obj = points.df
# filename = "/home/yi/Documents/RGIC01/backend/data/ttttt.shp"
# ExportToFile(obj,filename)
# test over










