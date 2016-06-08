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

## Classify an input raster into management zones
#
# Arguments:
#   Method:
#       K-Means
#   Object:
#       Raster brick
#       Single Band-Image
#   Number of zones:
#       A default number when there is no input
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
#   On voilation: Input raster file 

#### main.r #####
#obj = raster(file.path("..","..","data","2016-04-03_bert_boerma_kale_grond_index_cumulative.tif"))
#method = "kMeans"
        
ClassifyToZones = function(obj, method, zones_count = 3)
{   
    if (method != "kMeans")
    {
        stop("Fatal: System can not handle this method\n Try kMeans!")
    }
    else
    {
        valueTable = getValues(obj)
        km = kmeans(na.omit(valueTable), centers = zones_count, iter.max = 100, nstart = 10)
        head(km$cluster, na.rm=T)
        return(unique(km$cluster))
        
        rNA = setValues(raster(obj), 0)
        rNA[is.na(obj)] = 1
        rNA = getValues(rNA)
        
        valueTable = as.data.frame(valueTable)
        valueTable$zone[rNA == 1] = NAvalue
        
        Zones = raster(obj)
        Zones = setValues(Zones, valueTable$zone)
        return(Zones)
    }
}

#ClassifiedZones = ClassifyToZones(obj, method, zones_count)