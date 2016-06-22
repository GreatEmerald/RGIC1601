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

gdal_polygonizeR = function(x, outshape=NULL, attname='DN', gdalformat = 'GML', quiet=TRUE)
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
