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

## load Raster zone map
Project_dir = getwd()
filename = "2016-04-03_bert_boerma_kale_grond_index_cumulative.tif"
# test
filename = "Test_area.tif"
Field_map_dir = file.path(Project_dir,"backend","data",filename)


## Representive sampling location calculate formula
Field_raster = Input(Field_map_dir)[[1]]
point <- rasterToPoints(Field_raster)
hist()



###size_num = 20
###iteration_mum = 10000


samples = clhs(Field_raster,size = size_num )
spplot(samples)



#Get sampling location of one category





#Get sampling locationn of multiple categories





# export sampling number and coordinate to csv





