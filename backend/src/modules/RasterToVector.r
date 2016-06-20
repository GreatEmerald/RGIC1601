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
library(sp)
library(rgeos)

## Function for detecting unique values in a raster and converts these to polygons.
#
# Arguments:
#   MZrast_in:
#       character string: Homogenized Management Zone Raster.
#            Must be a format handled by GDAL.
#       character vector: RasterLayer to use as input, single-band.
#           Must be a format handled by GDAL.
#   VIrast_in:   
#       character string: OPTIONAL Vegetation index raster
#
# Maintains:
#   Environment
#   Input files
#
# On violation:
#   Stops script
#
# Returns:
#   A large list SpatialPolygonsDataFrame.
#   The amount of Management Zones equals the amount of elements in the list.
#   

gdal_polygonizeR = function(x, outshape=NULL, attname='DN', gdalformat = 'GML', quiet=TRUE)
{
  py.c <- Sys.which('gdal_polygonize.py')
  
  if (py.c == "")
  {
    warning("gdal_polygonizeR: Can't find gdal_polygonize.py on your system; resorting to SLOW rasterToPolygons implementation!")
    require(raster)
    return(rasterToPolygons(x, na.rm=TRUE, dissolve=TRUE))
  }
  
  if (!is.null(outshape))
  {
    f.exists = file.exists(outshape)
    if (any(f.exists))
      stop(paste('File already exists:', outshape), call.=FALSE)
  } else
    outshape = tempfile()
  if (is(x, 'Raster'))
  {
    require(raster)
    f = tempfile(fileext='.tif')
    writeRaster(x, f)
    rast.nm = normalizePath(f)
  } else if (is.character(x))
  {
    rast.nm <- normalizePath(x)
  } else
    stop('x must be either a file path (as a character string), or a Raster object.')
  full.c = sprintf("%1$s %2$s -f '%3$s' %4$s %5$s", py.c, rast.nm, gdalformat, outshape, attname)
  system(full.c)
  shp = readOGR(outshape, layer = attname, verbose=!quiet)
  return(shp)
}

RasterToVector = function(MZrast_in, VIrast_in=NA)
{
  if (class(MZrast_in) != "RasterLayer")
  {
    stop(paste("Input", (data.class(MZrast_in)), "is not a raster."))
  }
  
  if (nbands(MZrast_in) != 1)
  {
    stop(paste("Input", (data.class(MZrast_in)), "is not single-banded."))
  }

  MZrast_in = aggregate(MZrast_in, fact=10, fun=modal)
  UV = unique(MZrast_in) # detect unique values / Management Zones
  MZs = seq(0, (length(UV)-1), by=1)
  MZs_vector = list(1:length(UV)) # create a list for the return
  RtP = rasterToPolygons(MZrast_in, dissolve=TRUE, na.rm=TRUE)
  oldmetadata = metadata(MZrast_in)
    
  #RtP@data$OldMetadata = append(oldmetadata, list(newvariable2="test2"))
    
  for (i in MZs)
  {
    if (i < length(MZs))
    {
      RtP@data$Metadata[[i+1]] = paste(
        "This is polygon", i, "out of", tail(MZs,1), "management zones (incl border).")
    }
  }

  #if (is.na(VIrast_in))
  #{
    
  #}
    
    
  checkVI = (!any(is.na(getValues(VIrast_in))))
  print(checkVI)
  
  if (checkVI == TRUE)
  #if (exists("VIrast_in"))
  {
    if (nbands(VIrast_in) != 1)
    {
      stop(paste("Input", (data.class(VIrast_in)), "is not single-banded."))
    }
    r = VIrast_in
    sdata = RtP
    r.vals = extract(r, sdata)
    r.mean = unlist(lapply(r.vals, FUN=mean, na.rm = TRUE))
    #r.mean = suppressWarnings(lapply(r.vals, FUN=mean))
    sdata@data$VImeans =  r.mean
  }
  return(sdata)
}
#in_raster = raster(file.path("..", ".." , "output", "PC5_Class3_HomoCir005.gri"))
#in_VI = raster(file.path("..", ".." , "output", "Index_testfield_agg10.gri"))
#MZRasterToVector = RasterToVector(in_raster) #Homogeneous raster
#MZRasterToVector = RasterToVector(in_raster, in_VI) #Homogeneous raster
#spplot(MZRasterToVector)