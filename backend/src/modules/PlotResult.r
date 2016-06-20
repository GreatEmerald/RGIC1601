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
#   obj(SpatialPolygonsDataFrame)
#	samples(SpatialPointsDataFrame)



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


PlotResult = function(obj, samples= NULL, outliers = NULL, filename, Zones_count = 3,...)
	{
#	obj$id = factor(c(1:Zones_count), levels = c(1:Zones_count), labels = paste("Zone",c(1:Zones_count)))
	
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
		
	print(spplot(obj,scales = list(draw = T),col.regions = heat.colors(100))
	+ layer(sp.points(samples, pch = 17)))
	dev.off()
}



'''

	spplot(obj,scales = list(draw = T),col.regions = heat.colors(100))
	+ layer(sp.points(samples, pch = 17))
	
	
	
obj = readOGR("/home/yi/Documents/RGIC01/backend/data/test_vector.shp",layer = "test_vector")
filename = "/home/yi/Documents/RGIC01/backend/data/myplot3.png"
str(obj)
obj = Zones
samples = points.df
PlotResult(obj,samples,filename= filename)
'''