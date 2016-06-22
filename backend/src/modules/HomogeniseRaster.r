# Input handling module for the backend of the management zone generation tool
# Copyright (C) 2016 William Schuch, Geetika Rathee
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

#### Homogenizes the clustered zones ####

# Arguments:
#   zoneRaster:
#       character string: Management Zone Raster. Must be a format handled by GDAL.
#       character vector: RasterLayer to use as input, single-band.
#           Must be a format handled by GDAL.
#   window_type:
#       window type is used as the moving window in focal function 
#   
# Maintains:
#   Environment
#   Input files
#
# On violation:
#   stop()
#
# Returns:
#   a homogenised raster with integer value as zone number value


HomogeniseRaster = function(zoneRaster, window, min_ar, ...)
{
  if (nbands(zoneRaster) > 1)
  {
      stop("Input needs to be a single-band raster! /n Alternatively, choose a band of raster as an input object")
  }
      if (window == "circle")
      {
          w_size = sqrt(min_ar * 10000 / 3.14) / 2
      }
      else if (window == "rectangle")
      {
          w_size = sqrt(min_ar) / 2  
      }
      else if (window == "Gauss")
      {
          w_size = sqrt(min_ar * 10000 / 3.14) / 2
      }
      else
      {
          stop("Invalid window input!/n This arg should be one of circle, Gauss or rectangle")
      }
      
      fw = focalWeight(zoneRaster, w_size, type = window)
      new_raster = focal(zoneRaster, w = fw, fun = modal, pad = T)
      # the focal function uses modal function, which substitues the value of central cell 
      # with the value, whcih is in majority in the moving window
      zones = c(unique(new_raster))
      
      for(i in 1:length(zones))
      {
          new_raster[new_raster == zones[i]] = i
      }
      
      metadata(new_raster) = append(metadata(zoneRaster), list(filter_type = "modal", 
				      window_type = window, window_size = w_size))
      
      if (missing(...))
      {
          return(new_raster)
      }
      else
      {
          new_raster = writeRaster(new_raster, dataType = "INT1S", overwrite = T, ...)
          return(new_raster)
      }
}

