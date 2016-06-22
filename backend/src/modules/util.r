# Input handling module for the backend of the management zone generation tool
# Copyright (C) 2016 Dainius Masiliunas
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
#
# Source: http://johnbaumgartner.wordpress.com/2012/07/26/getting-rasters-into-shape-from-r/
# Based on: Lyndon Estes code, http://r-sig-geo.2731867.n2.nabble.com/Memory-management-with-rasterToPolygons-raster-and-rgeos-td7153049.html

gdal_polygonizeR = function(x, outshape=NULL, attname='layer', gdalformat = 'GML', quiet=TRUE)
{
    py.c <- Sys.which('gdal_polygonize.py')

    if (py.c == "")
    {
        warning("gdal_polygonizeR: Can't find gdal_polygonize.py on your system; resorting to SLOW rasterToPolygons implementation!")
        require(raster)
        return(rasterToPolygons(x, na.rm=TRUE))
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
  projection(shp) = projection(x)
  return(shp)
}

# Builds filenames by reading Date and Name from the environment
# type: File extension
# postfix: Additional string to append to the file base name
# directory: Write into this directory (../output by default)
OutputFile = function(type, postfix="", directory=file.path("..", "output"))
{
    if (class(type) != "character")
        stop("Character class expected for function argument 'type'")

    Filename = paste0(".", type)
    if (class(postfix) == "character" && postfix != "")
        Filename = paste0(postfix, Filename)
    if (exists("Name") && class(Name) == "character")
        Filename = paste0(Name, "_", Filename)
    if (exists("Date") && class(Name) == "character")
        Filename = paste0(Date, "_", Filename)
    return(file.path(directory, Filename))
}

# Get the EPSG number of the object (must be coercable into a prj4 string)
GetEPSG = function(obj)
{
    Proj = projection(obj)
    # Hack to remove the extra prj4 parts that raster adds upon import
    Proj = sub(" \\+ellps=WGS84 \\+towgs84=0,0,0", "", Proj)
    RefList = make_EPSG()
    for (i in 1:nrow(RefList))
    {
        # The below would be better, but right now it returns false positives...
        #if (compareCRS(as.character(RefList[i,"prj4"]), obj))
        if (!is.na(RefList[i,"prj4"]) && RefList[i,"prj4"] == Proj)
            return(as.integer(RefList[i,"code"]))
    }
    warning("Matching EPSG not found!")
    return(-1)
}
