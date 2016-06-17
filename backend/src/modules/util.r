# Source: http://johnbaumgartner.wordpress.com/2012/07/26/getting-rasters-into-shape-from-r/
# Based on: Lyndon Estes code, http://r-sig-geo.2731867.n2.nabble.com/Memory-management-with-rasterToPolygons-raster-and-rgeos-td7153049.html
# Modified to use GeoTIFFs and GMLs instead of ASCs and shapefiles.
gdal_polygonizeR <- function(x, outshape=NULL, attname='DN', gdalformat = 'GML', quiet=TRUE) {
  py.c <- Sys.which('gdal_polygonize.py')
  if (!length(py.c)) stop("Can't find gdal_polygonize.py on your system.")
  if (!is.null(outshape)) {
    outshape <- sub('\\.shp$', '', outshape)
    f.exists <- file.exists(paste(outshape, c('shp', 'shx', 'dbg'), sep='.'))
    if (any(f.exists)) stop(sprintf('File already exists: %s', 
      toString(paste(outshape, c('shp', 'shx', 'dbg'), sep='.')[f.exists])), call.=FALSE)
  } else outshape <- tempfile()
  if (is(x, 'Raster')) {
    require(raster)
    writeRaster(x, {f <- tempfile(fileext='.tif')})
    rast.nm <- normalizePath(f)
  } else if (is.character(x)) {
    rast.nm <- normalizePath(x)
  } else stop('x must be either a file path (as a character string), or a Raster object.')
  full.c <- sprintf("%1$s %2$s -f '%3$s' %4$s %5$s", py.c, rast.nm, gdalformat, outshape, attname)
  system(full.c)
  shp <- readOGR(outshape, layer = attname, verbose=!quiet)
  return(shp)
}
