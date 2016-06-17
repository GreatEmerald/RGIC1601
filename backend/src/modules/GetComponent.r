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

#### Performs PCA on the input stack or brick object to produce 1-B raster with most info ####

# Arguments:
#   Object:
#       Raster object; multi layered brick/stack
#	Mask: raster object or a spatial object
#   Additional argument: (higher values is recommended for saving memory space and faster processing)
#       Aggregation Factor
#       file name for writing the raster object to disk
#
# Maintains:
#   Environment
#   Input files
#
# On violation:
#   warning() when mask is missing
#   stop() when mask do not match projection of the input stack
#
# Returns:
#   Raster single-band (1-B) object; the 
#   layer will be the first principle component of the input brick


GetComponent = function(in_stack,field_mask, agg_factor = 10, ...)
{    
   if (missing(field_mask))
   {
       warning("Mask is essential for better results!")
   }
   else  
   {
       if(identical(projection(in_stack), projection(field_mask)) == F)
       {
           stop("It is necessary that stack and mask have same projections!")
       }
       else
       {
           in_stack = mask(in_stack, field_mask)
       }
   }
     
   in_stack =  aggregate(in_stack, fact = agg_factor)                      
   in_data = getValues(in_stack)
   
   # scale=T, save scaling applied to each variable, center = T, save means that were subtracted and retx = T, save PCA scores
   data.pca = princomp(na.omit(in_data), scale = T, center = T, retx = T)             # performs PCA, contains info on eigen vec etc.
   pc_data = predict(data.pca, in_data)                                               # writes principle components
   PC1 = raster(in_stack[[1]])
   PC1 = setValues(in_stack[[1]], pc_data[,1])
   metadata(PC1) = list(Method = "PCA", Aggregation = agg_factor)
   
   if (missing(...))
   {
       return(PC1)
   }
   else 
   {
       PC1 = writeRaster(PC1, overwrite = T, ...)
       return(PC1)
   }
}



