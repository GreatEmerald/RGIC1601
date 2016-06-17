# Input handling module for the backend of the management zone generation tool
# Copyright (C) 2016 Merijn Slagter
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

#### Calculates indices based on "soil" or "vegetation" ####

# Arguments:
#   Object:
#       Raster object; multi layered brick/stack
#   Additional argument: (for determining soil vs vegetation image)
#       fieldtype should be either "vegetation" or "soil"
#
# Maintains:
#   Environment
#   Input files
#
# On violation:
#   stop() for giving error message
#
# Returns:
#   NDVI raster if fieldtype = "vegetation" or
#   albedo raster if fieldtype = "soil"

#setwd(".." ,"..", "/RGIC1601/backend/data/")
#file1 = raster("2016-04-03_bert_boerma_kale_grond_transparent_reflectance_green.tif")
#file2 = raster("2016-04-03_bert_boerma_kale_grond_transparent_reflectance_red.tif")
#file3 = raster("2016-04-03_bert_boerma_kale_grond_transparent_reflectance_red edge.tif")
#file4 = raster("2016-04-03_bert_boerma_kale_grond_transparent_reflectance_nir.tif")

#in_stack = stack(file1,file2,file3,file4)

#rm(file1,file2,file3,file4)


CalculateIndex = function(in_stack,fieldtype, ...)
{ 
##    NDVI function
    if (fieldtype == "vegetation")
    {
      red_index = grep("red$", names(in_stack))
      nir_index = grep("nir", names(in_stack))  

      if (length(red_index) < 1)
      { 
        stop("could not find red band in the raster stack")
      }
        
      if (length(nir_index) < 1)
      {  
        stop("could not find nir band in the raster stack")
      }
      
      NDVI_stack = stack(in_stack[[red_index]], in_stack[[nir_index]])
      
        fun = function(rst) {(rst[[1]]-rst[[2]])/(rst[[1]]+rst[[2]])}
        new_raster = calc(NDVI_stack, fun)
        return(new_raster)
    } 
  
##    albedo function        
    if (fieldtype == "soil") 
    {
        new_raster = sum(in_stack)/dim(in_stack)[3]
        return(new_raster)
    } 
  
    stop("please note whether the image is of either soil or vegetation")

}
    
#CalculateIndex(in_stack, "vegetation")