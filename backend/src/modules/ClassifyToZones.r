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

#### Classify an input raster into management zones ####

# Arguments:
#   Method:
#       K-Means
#   Object:
#       Single Band-Image Raster Object
#   Number of zones:
#       Numeric dataType, A default number (3) when there is no input, 
#       Function can only handle less than 128 zones
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
#   Raster object with management zones, additionally raster object can be saved in specified directory 



ClassifyToZones = function(objPC, method = "KMeans", zones_count = 3, ...)
{   
    if (bandnr(objPC) > 1)
    {
        stop("Function accepts on only one band raster object")
    }
    if (zones_count >= 128)
    {
        stop("Too many classes, output will be too complicated for human interpretation/n 
                 Try a smaller number")
    }
    if (class(zones_count) != "numeric" )
    {
        stop("zones_count has to be a numeric variable")
    }
    if (method != "KMeans")
    {
        stop("Fatal: System can not handle this method\n Try KMeans!")
    }
    else
    {

      valueTable = getValues(objPC)
                
	    rNA = setValues(raster(objPC), 0)                     # create empty raster to store lost info of the input object during KMeans
	    rNA[is.na(objPC)] = 1
	    rNA = getValues(rNA)
            
      km = kmeans(na.omit(valueTable), centers = zones_count, iter.max = 50, nstart = 10)

	    valueTable = as.data.frame(valueTable)
	    valueTable[rNA == 1,] = NA
	    valueTable[rNA == 0,] = km$cluster
        
	    zones = raster(objPC)
	    zones = setValues(zones, valueTable[[1]])
	    metadata(zones) = append(metadata(objPC), list(cluster_method = "KMeans"))
	    
	    if (missing(...))
	    {
	        return(zones)
	    }
	    else
	    {
	        NAvalue(zones) <- NaN
	        zones = writeRaster(zones, dataType = "INT1S", overwrite = T, ...)
	        return(zones)
	    }
    }
}


