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
library(latticeExtra)

#
# Arguments:
#   obj(SpatialPolygonsDataFrame): 
#		The basic map need to be ploted
#	samples(SpatialPointsDataFrame): 
#		The sampling points need to be ploted, Can be Null
#	outliers(SpatialPointsDataFrame): 
#		The outliers points need to be ploted, can be Null
#	filename(character):
#		The export file directory, 
#
#
# Maintains:
#   Environment
#   Input files
#
# On violation:
#   Stops script and gives a message
#
# Returns:
#   A list of 4, with the Homogenized raster in [[2]].
#   The amount of Management Zones equals the amount of elements.


PlotResult = function(obj, samples= NULL, outliers = NULL, filename,...)
	{
	
	obj$DN = factor(c(min(obj$DN):max(obj$DN)), levels = c(min(obj$DN):max(obj$DN)), labels = paste("Zone",c(min(obj$DN):max(obj$DN))))
	if (class(samples) != "NULL")
	{sample = list (samples , pch = 3, col = "darkgreen",cex = 1.7)}
	if (class(samples) != "NULL")
	{outlier = list(outliers, pch = 13, col = "black",cex = 1)}
	
	
	# check the expected export format
	if (file_ext(filename) == "jpg")
		{
		jpeg(filename)
		}
	if (file_ext(filename) == "png")
		{
		png(filename)
		}
	if (file_ext(filename) == "pdf")
		{png(filename)
		}
		
		
	# check the expected results
		
	print(spplot(obj[2],scales = list(draw = T),col.regions = heat.colors(100),sp.layout = list(sample)))

	dev.off()
}


 	
# obj = readOGR("//home/yi/Documents/RGIC/backend/data/Zone-vector/zones.shp",layer = "zones")
# filename = "/home/yi/Documents/RGIC/backend/output/myplot3.jpg"
# str(obj)
# obj = Zones
# samples = points.df
# PlotResult(obj,samples = samples,filename= filename)

#filename = "/home/yi/Documents/RGIC/backend/data/onion_homogenised.grd"
#HomogeneousMZ = Input(filename)
#plot(HomogeneousMZ)