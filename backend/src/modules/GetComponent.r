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
#   Object:
#       Raster object; multi layered brick/stack
#	Mask: raster object
#   Additional argument: (recommended for saving memory space)
#       Aggregation Factor
#
# Maintains:
#   Environment
#   Input files
#
# On violation:
#   stop()
#
# Returns:
#   Raster single-band layer object; the 
#   layer will be the first principle component of the input brick

#setwd("/home/grathee/Documents/RGIC01/backend/data/")
#file1 = raster("2016-04-03_bert_boerma_kale_grond_transparent_reflectance_green.tif")
#file2 = raster("2016-04-03_bert_boerma_kale_grond_transparent_reflectance_red.tif")
#file3 = raster("2016-04-03_bert_boerma_kale_grond_transparent_reflectance_red edge.tif")
#file4 = raster("2016-04-03_bert_boerma_kale_grond_transparent_reflectance_nir.tif")
#field_mask = raster("2016-04-03_bert_boerma_kale_grond_index_cumulative_TestArea.tif")

#file1 = crop(file1, extent(ext))
#file2 = crop(file2, extent(ext))
#file3 = crop(file3, extent(ext))
#file4 = crop(file4, extent(ext))

#in_stack = stack(file1,file2,file3,file4)

#rm(file1,file2,file3,file4,ext)


GetComponent = function(in_stack,field_mask = NA, agg_factor = 10, ...)
{    
   if (mask != NA)
   {
       in_stack = mask(in_stack, field_mask)
   }
   
  
   in_stack =  aggregate(in_stack, fact= agg_factor)
   in_data = getValues(in_stack)
   # scale=T save scaling applied to each variable, Center = T, save means that were subtracted, retx=F don't save PCA scores
   data.pca = princomp(na.omit(in_data), scale = F, center = F, retx = F)
  
   new_data = predict(data.pca, in_data)
   new_raster = raster(in_stack[[1]])
   new_raster = setValues(in_stack[[1]], new_data[,1])
   
   # OR
   
   #stack.pca = rasterPCA(in_stack, nComp=1,
   #writeRaster(filenames)
   #)
   
   return(new_raster)
}

#GetComponent(in_stack, field_mask, 15)