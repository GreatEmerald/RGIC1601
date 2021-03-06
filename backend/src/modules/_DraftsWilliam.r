# Draft script for the backend of the management zone generation tool
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

## Note: This script only brings different modules in modules/ together.
## No code belonging to one of the modules should go here.

#### Required libraries ####
library(raster)
library(rgdal)
library(sp)
library(spatstat)
library(maptools)
library(rgeos)
#library(igraph)

#rm(list = ls())  # Clear the workspace!
#ls() ## no objects left in the workspace
#start.time = Sys.time()


getwd()
#setwd("./modules")
WS = raster(file.path("..", ".." , "data", "2016-04-03_bert_boerma_kale_grond_index_cumulative_TestArea.tif"))
WS = raster(file.path("..", ".." , "data", "2016-04-03_bert_boerma_kale_grond_index_cumulative.tif"))
WS = raster(file.path("..", ".." , "output", "index_testfield_agg10.gri")) # VI
Zones_PC5 = raster(file.path("..", ".." , "output", "Zones_PC5.gri"))
#Zones_PC5_Filterd = raster(file.path("..", ".." , "output", "Zones_PC5.gri..."))
#WSS = stack(WS)
#WSB = brick(WS)


# GetOutliers

GetOutl = GetOutliers(WS, Q=0.005, L=10) # used for 'Singe-band image'
plot(GetOutl)
hist(WS, maxpixels=1000000, plot=TRUE, freq=TRUE, breaks=200)

return(list(rast_in,
            Vec_upper, Vec_lower,
            SLDF_upper, SLDF_lower,
            Polyclust_upper, Polyclust_lower,
            centroidsDF_upper, centroidsDF_lower,
            centroidDF))

rv_pnt_up = list("sp.points", GetOutl[[2]], col = "red")
rv_pnt_lo = list("sp.points", GetOutl[[3]], col = "green")

rv_lin_up = list("sp.lines", GetOutl[[4]], col = "red")
rv_lin_lo = list("sp.lines", GetOutl[[5]], col = "green")

rv_pol_up = list("sp.polygons", GetOutl[[6]], fill = "white")
rv_pol_lo = list("sp.polygons", GetOutl[[7]], fill = "white")

rv_cent_up = list("sp.points", GetOutl[[8]], col = "yellow")
rv_cent_lo = list("sp.points", GetOutl[[9]], col = "white")

SPplotWS = spplot(GetOutl[[1]], scales = list(draw = TRUE),
                   xlab = "X", ylab = "Y",
                   #ol.regions = rainbow(99, start=.1),
                   sp.layout = list(rv_cent_up,rv_cent_lo))
SPplotWS

spplot(GetOutl[[10]])
plot(GetOutl[[10]])


# PLot Result
PlotResult(MZRasterToVectorVI,filename= "plot1.png")


# GetSamplingLocations

GSL = GetSamplingLocations(in_raster)


# Export

ExportToFile(MZRasterToVectorVI, file.path("..", ".." , "output", "MZtest.shp"))
ExportToFile(GetOutl[[10]], file.path("..", ".." , "output", "Outliers1.shp"))

# RasterToVector

#MZRasterToVector = RasterToVector(HomogeniseRaster[[2]])
#spplot(ClassifiedZones)

#spplot(MZRasterToVector[[2]])

MZ_A2_Fact10 = aggregate(MZRasterToVector[[2]], fact = 10, fun = )
spplot(MZ_A2_Fact10)


SPplotAgg = spplot(MZRasterToVector[[1]], scales = list(draw = TRUE),
                   xlab = "X", ylab = "Y",
                   ol.regions = rainbow(99, start=.1))#,
#sp.layout = c('sp.lines', RtC, col='red', pch=10))
SPplotAgg


#contour(HomogeniseRaster[[2]]), nlevels = 1)
RtC = rasterToContour(HomogeniseRaster[[2]], levels = c(1,2,3,4)) #, nlevels = 3 ) #(UV_RtC)) #, maxpixels=100000000)
RtC_ = rasterToContour(HomogeniseRaster[[2]])
contour(HomogeniseRaster[[2]], method = "edge")
spplot(RtC_)

SP <- rasterToPolygons(clump(HomogeniseRaster[[2]]>1), dissolve=TRUE)
spplot(SP)


outliers = GetOutliers(WS, 0.05)


Clumpie = clump(RtC)

RtC_L1 = subset(RtC_, RtC_@data$level == "1.2")
spplot(RtC_L1)

RtC_L3 = subset(RtC_, RtC_@data$level == "3")
spplot(RtC_L3)

#contour(HomogeniseRaster[[2]], method = "edge", nlevels = 3)
Contour_Lenght = gLength(RtC, byid=T)
Polyclust = gPolygonize(RtC, getCutEdges=F)
PolyArea = gArea(Polyclust, byid = T)
Polyclust = SpatialPolygonsDataFrame(Polyclust,data = data.frame(PolyArea), match.ID = F)

Polyclust_Large = (Polyclust_Large@data&PolyArea > 20)

# using subset function
Polyclust_Large <- subset(Polyclust, PolyArea > 1)#, select=c(ID, Weight)) 
spplot(Polyclust_Large)



RtP = rasterToPolygons(HMZ[[2]], dissolve=T, na.rm=T)
spplot(RtC)
spplot(Polyclust)
UV_RtC = unique(HMZ[[2]])
spplot(RtP)

MZ_test = as.SpatialPolygons.PolygonsList(RtC)


rasterize((x, y, field, fun='last', background=NA, 
           mask=FALSE, update=FALSE, updateValue='all', filename="", ...)
)

Disagg <- disaggregate(HomogeniseRaster[[2]], fact=5, method='')
spplot(Disagg)

Y <- raster(nrow=10, ncol=10)
ReSamp = resample(HomogeniseRaster[[2]], Y , method="ngb")

plot(Y)
#GetOutl = GetOutliers(WS,0.005) # used for 'Singe-band image'
GetOutl_MZ = GetOutliers(HomogeniseRaster[[2]],0.005) # used for 'Homogeneous MZ raster'


Vec_MZ2 = RasterToVector(HomogeniseRaster[[2]])
Pol_MZ = rasterToPolygons(HomogeniseRaster[[2]], dissolve=TRUE, na.rm=TRUE)
Pol_MZ2 = subset(Pol_MZ, (Pol_MZ@data$layer == 2))
#gas = gArea(Pol_MZ2, byid = T)/10000
#Polyclust = SpatialPolygonsDataFrame(Vec_MZ2[[2]], data = data.frame(gas), match.ID = F)
SmallClus = subset(Pol_MZ2, Pol_MZ@polygons[[1]]@Polygons[[1]]@area < 0.5)

for (i in Pol_MZ@polygons)
  print (area)

spplot(Pol_MZ2)

spplot(Polyclust)
Dens = density(HomogeniseRaster[[2]], adjust = 1)  # create density object
spplot(Dens)

Polyclust = gPolygonize(HomogeniseRaster[[2]], getCutEdges=FALSE)


Dcl = contourLines(HomogeniseRaster[[2]], nlevels = 3)

spplot(HomogeniseRaster[[2]])

sSp = as(GetOutl[[3]], "ppp")  # convert points to pp class
Dens = density(sSp, adjust = 0.1)  # create density object
class(Dens)  # just for interest: it's got it's of pixel image class
plot(Dens)  # default plot for density

Dsg = as(Dens, "SpatialGridDataFrame")  # convert to spatial grid class
SPplotDens = spplot(Dsg, scales = list(draw = TRUE),
                    xlab = "X", ylab = "Y",
                    ol.regions = rainbow(99, start=.1) ,
                    sp.layout = c('sp.points', GetOutl[[3]], col='red', pch=16))
SPplotDens

contour(density(sSp, adjust = 0.2), nlevels = 4)  # plot as contours - this is where we're heading

Dim <- as.image.SpatialGridDataFrame(Dsg)  # convert again to an image
Dcl <- contourLines(Dim, nlevels = 8)  # create contour object - change 8 for more/fewer levels
SLDF <- ContourLines2SLDF(Dcl)  # convert to SpatialLinesDataFrame
plot(SLDF, col = terrain.colors(8))
SPplotCont = spplot(SLDF, scales = list(draw = TRUE),
                    xlab = "X", ylab = "Y",
                    ol.regions = rainbow(99, start=.1))
SPplotCont 


Polyclust <- gPolygonize(SLDF[5, ])
gas <- gArea(Polyclust, byid = T)/10000
Polyclust <- SpatialPolygonsDataFrame(Polyclust, data = data.frame(gas), match.ID = F)
plot(Polyclust)

centroids <- getSpPPolygonsLabptSlots(Polyclust)
plot(centroids)

centroidsDF = as.data.frame(centroids)
centroidsSPDF <- SpatialPointsDataFrame(centroidsDF, data = data.frame(gas))
spplot(centroidsSPDF)

cAg <- aggregate(GetOutl[[3]], by = Polyclust, FUN = length)
# lb <- gBoundary(lnd)
plot(Dens, main = "")
plot(lnd, border = "grey", lwd = 2, add = T)
plot(SLDF, col = terrain.colors(8), add = T)
plot(cAg, col = "red", border = "white", add = T)
graphics::text(coordinates(cAg) + 1000, labels = cAg$CODE)



aggdata = aggregate(GetOutl[[3]], by=list(coord), FUN=mean, na.rm=TRUE)
aggdata = aggregate(GetOutl[[3]], by=list(coord), FUN=mean)
plot(aggdata)


### PREVIOUS CULCULATIONS (no functions) ###

# Check if input (RasterLayer/RasterStack/RasterBrick) is singe-banded:
if (nbands(WS) > 1)
{
  paste("Input", (data.class(WS)), "is not single-banded.")
  #return(NA)
}

if (length(WSS@layers) > 1)
{
  paste("Input", (data.class(WSS)), "is not single-banded.")
  #return(NA)
}
if (nbands(WSB) > 1)
{
  paste("Input", (data.class(WSB)), "is not single-banded.")
  #return(NA)
}

#plot a histogram
hist(WS, maxpixels=1000000, plot=TRUE, freq=TRUE, breaks=200)

#calculate values to detect outliers
WSmean = cellStats(WS,mean)
WSmin = cellStats(WS,min)
WSmax = cellStats(WS,max)
quantiles = quantile(WS, c(.001, .999))

# Extract the max and the min outliers
WS_outliers_min = WS < quantiles[[1]]
WS_outliers_max = WS > quantiles[[2]]

# Create spatial point dataframe
Vec = rasterToPoints(WS,fun=function(x){x>quantiles[[2]] | x<quantiles[[1]]}, spatial=TRUE)

#plotting soem results
plot(WS_outliers_min)
plot(WS_outliers_max)
plot(Vec)
plot(WS)

r <- raster(nrow=3, ncol=3)
r[] <- 1:ncell(r)
s <- raster(nrow=10, ncol=10)
s <- resample(r, s, method='bilinear')
#par(mfrow=c(1,2))
#plot(r)
#plot(s)



Simp_MZ2 = gSimplify(MZRasterToVector[[2]], tol = 2)
spplot(Simp_MZ2)








# reproject
prj_string_RD <- CRS("+proj=sterea +lat_0=52.15616055555555
                     +lon_0=5.38763888888889 +k=0.9999079 +x_0=155000 +y_0=463000
                     +ellps=bessel +towgs84=565.2369,50.0087,465.658,
                     -0.406857330322398,0.350732676542563,-1.8703473836068,
                     4.0812 +units=m +no_defs")

prj_string_WGS84_31 <- CRS("+proj=utm +zone=31 +ellps=WGS84 +datum=WGS84 +units=m +no_defs")

Proj4js.defs["EPSG:32631"] = "+proj=utm +zone=31 +ellps=WGS84 +datum=WGS84 +units=m +no_defs";


PROJ4WS = WS@crs

Vec@proj4string = prj_string_RD
Vec@proj4string = prj_string_WGS84_31
Vec@proj4string = WS@crs

ptransform(Vec, '+proj=latlong +ellps=sphere',
           '+proj=merc +ellps=sphere')


#Write as geojson
writeOGR(RTC, 'test5','Vec', driver='GeoJSON')
file.rename("test5", "test5.geojson")


r <- MZRasterToVector[[2]]
# convert raster to polygons
sp <- rasterToPolygons(r, dissolve = T)
plot(sp)
# addition transformation to distinguish well the set of polygons
polys <- slot(sp@polygons[[1]], "Polygons")

require(Hmisc) # for Bezier curve
output <- SpatialPolygons(
  Srl = lapply(1:length(polys),
               function(x){
                 p <- polys[[x]]
                 
                 #applying bezier curve for smoothing polygon edges
                 px <- slot(polys[[x]], "coords")[,1]
                 py <- slot(polys[[x]], "coords")[,2]
                 bz <- bezier(px, py)
                 slot(p, "coords") <- as.matrix(cbind(bz$x,bz$y))                
                 
                 # create Polygons object
                 poly <- Polygons(list(p), ID = x)
                 return(poly)
               }),
  proj4string = CRS("+init=epsg:4326")
)


library(akima)
library(maptools)
library(zoo)
gpclibPermit()
library(raster)
data(akima)

# define de dimension of grid
dimgrid <- 1000

# Interpolate to regular grid
ak.li <- interp(akima$x, akima$y, akima$z, xo=seq(min(akima$x),
                                                  max(akima$x), length = dimgrid),yo=seq(min(akima$y), max(akima$y),
                                                                                         length = dimgrid),linear = TRUE, duplicate = "mean")

# Show interpolation
image(ak.li)
points(akima)
with(akima, text(x, y, formatC(z,dig=2), adj = -0.1))

#r <- raster(ak.li)
r <- ClassifiedZones
plot(r)

pol <- rasterToPolygons(Zones_PC5, fun=function(x){x==3}, dissolve=FALSE)
#pol2 <- rasterToPolygons(r, fun=function(x){x<=40 & x>20})
#pol3 <- rasterToPolygons(r, fun=function(x){x<=20})

pol = HomogeniseRaster[[2]]

plot(pol, col="red")
spplot(pol)

# Show the polygons
plot(pol, add=T, col='yellow')
plot(pol2, add=T, col='grey')
plot(pol3, add=T, col='lightblue')



### MAKE A FLUENT POLYGON FROM RASTER
digits = 1
for (i in 1:length(pol@polygons))
{
  for (j in 1:length(pol@polygons[[i]]@Polygons))
  {
    pol@polygons[[i]]@Polygons[[j]]@coords = round(pol@polygons[[i]]@Polygons[[j]]@coords, digits)
  }
}

# Attempt to merge similar adjacent into one polygon
union = unionSpatialPolygons(pol, ID=rep(1, times=length(pol@polygons)))

# Show
plot(union, add=TRUE, col="white")

# Nombre de vertices
Lenght_Pol = length(union@polygons[[1]]@Polygons)

for (i in 1:Lenght_Pol)
{
  crds=union@polygons[[1]]@Polygons[[i]]@coords
  print (i)
}
crds=union@polygons[[1]]@Polygons[[2]]@coords
tmp=length(crds[,1])

nexCoordX= rollmean(c(crds[tmp,1], crds[,1], crds[1,1]), k=2)
nexCoordY= rollmean(c(crds[tmp,2], crds[,2], crds[1,2]), k=2)
lines(nexCoordX, nexCoordY, col="red", lwd=2)

Sr1 = Polygon(cbind(nexCoordX,nexCoordY))
plot(SpP)
Srs1 = Polygons(list(Sr1), "s1")
SpP = SpatialPolygons(list(Srs1))

OUT = file.path("..", ".." , "output", "TEST_MZs2.shp")
ExportToFile(MZRasterToVectorVI,OUT)


## _ _ _ _
## finishing the script and calculate running time of the script
#end.time = Sys.time()
#time.taken = end.time - start.time
#paste("The script has finished running in", time.taken, "seconds.")