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
library(rgdal)
library(EMCluster)

#### Classify an input raster into management zones ####

# Arguments:
#   Method:
#       K-Means
#   Object:
#       Single Band-Image Raster Object
#   Number of zones:
#       A default number (3) when there is no input
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
#   Raster object with management zones with file saved in the output directory 

#setwd("/home/grathee/Documents/RGIC01/backend/data/")
#obj = raster("2016-04-03_bert_boerma_kale_grond_index_cumulative_TestArea.tif")
#method = "Herarchical"

#valueTable = getValues(obj)
               
#rNA = setValues(raster(obj), 0)
#rNA[is.na(obj)] = 1
#rNA = getValues(rNA)

#obj = na.omit(obj)
#obj = as.matrix(obj)
#distance = dist(obj, method = "euclidean")


ClassifyToZones = function(obj, method, zones_count = 3, ...)
{   
    if (method != c("KMeans", "Herarchical","EM"))
    {
        stop("Fatal: System can not handle this method\n Try KMeans or Herarchical or EM!")
    }
    else
    {
        valueTable = getValues(obj)
                
	rNA = setValues(raster(obj), 0)
	rNA[is.na(obj)] = 1
	rNA = getValues(rNA)
        
        if (method = "KMeans")
        {
            km = kmeans(na.omit(valueTable), centers = zones_count, iter.max = 50, nstart = 10)

	    valueTable = as.data.frame(valueTable)
	    valueTable[rNA == 1,] = NA
	    valueTable[rNA == 0,] = km$cluster
        
	    Zones = raster(obj)
	    Zones = setValues(Zones, valueTable[[1]])
	    Zones = writeRaster(Zones, ...)
	    
	    return(Zones)
        }
        #Herarchical
        else if (method = "Herarchical")
        {
	    distance = dist(valueTable, method = "manhattan")
	    Hcluster = hclust(distance, method = "ward")

	    valueTable = as.data.frame(valueTable)
	    valueTable[rNA == 1,] = NA
	    valueTable[rNA == 0,] = Hcluster
        
	    Zones = raster(obj)
	    Zones = setValues(Zones, valueTable[[1]])
	    Zones = writeRaster(Zones, ...)
	    
	    return(Zones)
        }
        else if (method = "EM")
        {
	    ret = init.EM(obj,nclass = 3, min.n.iter=10)
	    EMcluster = assign.class(obj, ret)
  
	    valueTable = as.data.frame(valueTable)
	    valueTable[rNA == 1,] = NA
	    valueTable[rNA == 0,] = EMcluster
        
	    Zones = raster(obj)
	    Zones = setValues(Zones, valueTable[[1]])
	    Zones = writeRaster(Zones, ...)
	    return(Zones)
        }
    }
}


#ClassifiedZones = ClassifyToZones(obj, method)

