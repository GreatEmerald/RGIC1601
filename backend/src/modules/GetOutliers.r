# Input handling module for the backend of the management zone generation tool
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
library(raster)
library(rgdal)

## Function for detecting outliers in a single band rater file, using GDAL
#
# Arguments:
#   rast_in:
#       character string: RasterLayer to use as input. Must be a format handled by GDAL.
#       character vector: RasterLayer to use as input, single-band.
#           Must be a format handled by GDAL.
#   Q:
#       character string: Quantile for outlier. 
#
# Maintains:
#   (Environment)
#   Input files
#
# On violation:
#   Prints an error() and returns NA
#
# Returns:
#   A Formal Class SpatialPointsDataFrame,
#   with the outliers.

#rm(list = ls())  # Clear the workspace!
#ls() ## no objects left in the workspace
#start.time = Sys.time()


getwd()
#WS = raster(file.path("..", ".." , "data", "2016-04-03_bert_boerma_kale_grond_index_cumulative_TestArea.tif"))
WS = raster(file.path("..", ".." , "data", "2016-04-03_bert_boerma_kale_grond_index_cumulative.tif"))
#WSS = stack(WS)
#WSB = brick(WS)

# INTO THE FUNCTION
GetOutliers = function(rast_in, Q)
{
  if (nbands(rast_in) > 1)
  {
    stop(paste("Input", (data.class(rast_in)), "is not single-banded."))
    return(NA)
  }
  
  else
  {
    quantiles = quantile(rast_in, c(Q,1-Q))
    Vec = rasterToPoints(rast_in, fun=function(x){x>quantiles[[2]] | x<quantiles[[1]]}, spatial=TRUE)
    #plot(Vec)
    return(quantiles)
  }
  #plot(Vec)
}
GetOutliers(WS,0.001)


### PREVIOUS CULCULATIONS (no functions) ###

# Check if input (RasterLayer/RasterStack/RasterBrick) is singe-banded:
  if (nbands(WS) > 1)
  {
    paste("Input", (data.class(WS)), "is not single-banded.")
    #return(NA)
  }

  if (length(WSS@layers) > 1)
  {
    paste("Input", (data.class(WSS)), "is not single-banded.")
    #return(NA)
  }
  if (nbands(WSB) > 1)
  {
    paste("Input", (data.class(WSB)), "is not single-banded.")
    #return(NA)
  }

#plot a histogram
hist(WSS, maxpixels=1000000, plot=TRUE, freq=TRUE, breaks=200)

#calculate values to detect outliers
WSmean = cellStats(WS,mean)
WSmin = cellStats(WS,min)
WSmax = cellStats(WS,max)
quantiles = quantile(WS, c(.001, .999))

# Extract the max and the min outliers
WS_outliers_min = WS < quantiles[[1]]
WS_outliers_max = WS > quantiles[[2]]

# Create spatial point dataframe
Vec = rasterToPoints(WS,fun=function(x){x>quantiles[[2]] | x<quantiles[[1]]}, spatial=TRUE)

#plotting soem results
plot(WS_outliers_min)
plot(WS_outliers_max)
plot(Vec)
plot(WS)














# reproject
prj_string_RD <- CRS("+proj=sterea +lat_0=52.15616055555555
										 +lon_0=5.38763888888889 +k=0.9999079 +x_0=155000 +y_0=463000
                     +ellps=bessel +towgs84=565.2369,50.0087,465.658,
                     -0.406857330322398,0.350732676542563,-1.8703473836068,
                     4.0812 +units=m +no_defs")

prj_string_WGS84_31 <- CRS("+proj=utm +zone=31 +ellps=WGS84 +datum=WGS84 +units=m +no_defs")

WS@crs

Vec@proj4string = prj_string_RD
Vec@proj4string = prj_string_WGS84_31
Vec@proj4string = WS@crs

ptransform(Vec, '+proj=latlong +ellps=sphere',
           '+proj=merc +ellps=sphere')


#Write as geojson
writeOGR(Vec, 'test5','Vec', driver='GeoJSON')
file.rename("test5", "test5.geojson")

## _ _ _ _
## finishing the script and calculate running time of the script
#end.time = Sys.time()
#time.taken = end.time - start.time
#paste("The script has finished running in", time.taken, "seconds.")
