# Main script for the backend of the management zone generation tool
# Copyright (C) 2016 Dainius Masiliunas, William Schuch, Geetika Rathee
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

## Note 1: This script only brings different modules in modules/ together.
## No code belonging to one of the modules should go here.

## Note 2: It is expected that your working directory is set to backend/src/

#### Import modules ####

source("modules/input.r")
source("modules/GetComponent.r")
#source("modules/GetOutliers.r")
source("modules/ClassifyToZones.r")

#### Input variables ####

InputFiles = "../data/2016-04-03_bert_boerma_kale_grond_index_cumulative_TestArea.tif"
ZoneRasterFilename = file.path("..", "output", "CumulativeSamplingLocations.grd")

#### Main script ####

InputImageCumulative = Input(InputFiles)
InputImage = Input(c("../data/2016-04-03_bert_boerma_kale_grond_transparent_reflectance_green.tif",
    "../data/2016-04-03_bert_boerma_kale_grond_transparent_reflectance_red.tif",
    "../data/2016-04-03_bert_boerma_kale_grond_transparent_reflectance_red edge.tif",
    "../data/2016-04-03_bert_boerma_kale_grond_transparent_reflectance_nir.tif"), bands=c(1,3,5,7))
    
if (!file.exists(ZoneRasterFilename))
{
    CumulativeManagementZones = ClassifyToZones(InputImageCumulative, "kMeans", filename=ZoneRasterFilename, datatype="INT1S")
} else
    CumulativeManagementZones = raster(ZoneRasterFilename)
    
CumulativeSamplingLocations = GetSamplingLocations(CumulativeManagementZones)


#SingleBandImageToOutlierPoints = GetOutliers()
