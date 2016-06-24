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
source("modules/ClassifyToZones.r")
source("modules/HomogeniseRaster.r")
source("modules/CalculateIndex.r")
source("modules/RasterToVector.r")
source("modules/GetOutliers.r")
source("modules/GetSamplingLocations.R")
source("modules/ExportToFile.R")
source("modules/PlotResult.r")
source("modules/util.r")

#### Input/Output variables - this should be filled out! ####

# The input image (all should be bands of the same image); bands say which band to keep from the images
InputImage = Input(c(file.path("..", "data", "2016-04-03_bert_boerma_kale_grond_transparent_reflectance_green.tif"),
    file.path("..", "data", "2016-04-03_bert_boerma_kale_grond_transparent_reflectance_red.tif"),
    file.path("..", "data", "2016-04-03_bert_boerma_kale_grond_transparent_reflectance_red edge.tif"),
    file.path("..", "data", "2016-04-03_bert_boerma_kale_grond_transparent_reflectance_nir.tif")),
    bands=1)
# Define whether the above image is a "soil" or "vegetation" map for calculating colours, or blank to skip (faster)
ImageType = "soil"

# A mask file that defines the boundary of the field precisely (polygons, but could also be a raster with not null = field)
MaskFile = Input(file.path("..", "data", "2016-04-03_bert_boerma_kale_grond_index_cumulative.tif"))

# Date and name for generating nice filenames
Date="2016-04-03"
Name="bert_boerma_kale_grond"

# Output filenames. All of the listed files will be generated (with above date and name, in ../output by default)
ZoneOutputFiles = c(OutputFile("kml", "zones"), OutputFile("sql", "zones"), OutputFile("shp", "zones"))
OutlierOutputFiles = c(OutputFile("kml", "outliers"), OutputFile("sql", "outliers"),
    OutputFile("gpx", "outliers"), OutputFile("shp", "outliers"))
SampleOutputFiles = c(OutputFile("kml", "samples"), OutputFile("sql", "samples"),
    OutputFile("gpx", "samples"), OutputFile("shp", "samples"))
PlotOutputFile = OutputFile("png", "plot")

# The number of pixels to merge for PCA and extracting vegetation indices.
# Low factors take a lot of time and memory but is more precise
AggregationFactor = 2

# Intermediary file names. These do not matter much unless you are low on space
PC1IntermediaryFile = file.path("..", "output", "PC1.grd")
ZoneRasterIntermediaryFile = file.path("..", "output", "classified.grd")
HomogenisedIntermediaryFile = file.path("..", "output", "homogenised.grd")

#### Main script - changes are not necessary but possible ####

# Get the first principal component
if (!file.exists(PC1IntermediaryFile))
{
    FirstComponent = GetComponent(InputImage, MaskFile, agg_factor=AggregationFactor, filename=PC1IntermediaryFile)
} else
    FirstComponent = raster(PC1IntermediaryFile)

if (!file.exists(ZoneRasterIntermediaryFile))
{
    ManagementZones = ClassifyToZones(FirstComponent, "KMeans", filename=ZoneRasterIntermediaryFile)
} else
    ManagementZones = raster(ZoneRasterIntermediaryFile)

if (!file.exists(HomogenisedIntermediaryFile))
{
    HomogeneousMZ = HomogeniseRaster(ManagementZones, "circle", 0.05, filename=HomogenisedIntermediaryFile)
} else
    HomogeneousMZ = raster(HomogenisedIntermediaryFile)

if (ImageType == "vegetation" || ImageType == "soil")
{
    ColourIndex = CalculateIndex(InputImage, ImageType)
    ManagementZoneVector = RasterToVector(HomogeneousMZ, ColourIndex)
} else
    ManagementZoneVector = RasterToVector(HomogeneousMZ)
ExportToFile(ManagementZoneVector, ZoneOutputFiles)

OutlierPoints = GetOutliers(FirstComponent)
ExportToFile(OutlierPoints, OutlierOutputFiles)
SamplingLocations = GetSamplingLocations(HomogeneousMZ)
ExportToFile(SamplingLocations, SampleOutputFiles)

PlotResult(ManagementZoneVector, SamplingLocations, OutlierPoints, PlotOutputFile)
