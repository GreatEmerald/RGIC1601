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
source("modules/GetOutliers.r")
source("modules/ClassifyToZones.r")
source("modules/ExportToFile.R")

#### Input/Output variables ####

InputImage = Input(c(file.path("..", "data", "2016-04-03_bert_boerma_kale_grond_transparent_reflectance_green.tif"),
    file.path("..", "data", "2016-04-03_bert_boerma_kale_grond_transparent_reflectance_red.tif"),
    file.path("..", "data", "2016-04-03_bert_boerma_kale_grond_transparent_reflectance_red edge.tif"),
    file.path("..", "data", "2016-04-03_bert_boerma_kale_grond_transparent_reflectance_nir.tif")),
    bands=1)

ZoneOutputFiles = c(file.path("..", "output", "zones.kml"), file.path("..", "output", "zones.sql"))
OutlierOutputFiles = c(file.path("..", "output", "outliers.kml"), file.path("..", "output", "outliers.sql"), file.path("..", "output", "outliers.gpx"), file.path("..", "output", "outliers.shp"))
SampleOutputFiles = c(file.path("..", "output", "samples.kml"), file.path("..", "output", "samples.sql"), file.path("..", "output", "samples.gpx"), file.path("..", "output", "samples.shp"))

PC1IntermediaryFile = file.path("..", "output", "PC1.grd")
ZoneRasterIntermediaryFile = file.path("..", "output", "classified.grd")
HomogenisedIntermediaryFile = file.path("..", "output", "homogenised.grd")

#### Main script ####

# Get the first principal component
if (!file.exists(PC1IntermediaryFile))
{
    FirstComponent = GetComponent(InputImage, filename=PC1IntermediaryFile)
} else
    FirstComponent = raster(PC1IntermediaryFile)

if (!file.exists(ZoneRasterIntermediaryFile))
{
    ManagementZones = ClassifyToZones(FirstComponent, "KMeans", filename=ZoneRasterIntermediaryFile, datatype="INT1S")
} else
    ManagementZones = raster(ZoneRasterIntermediaryFile)
    
SamplingLocations = GetSamplingLocations(CumulativeManagementZones, 0.0005)

OutlierPoints = GetOutliers(ManagementZones)

#SingleBandImageToOutlierPoints = GetOutliers()

ExportToFile(ManagementZones, file.path("..", "output", "PC1.grd"))
