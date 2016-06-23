#!/bin/bash
# Example script for creating a PostGIS database and load in the SQL files
# OS specific; will likely not run as-is, use for reference only

# Start GeoServer with WFS-T capabilities, JSONP support required
ENABLE_JSONP=true geoserver_start.sh

# Create a new PostGIS database (if it does not exist):
createdb -O postgres rgic01
# Make it a PostGIS database (paths depend on OS/version):
psql -U postgres rgic01 -f /usr/share/postgresql/9.4/contrib/postgis-2.2/postgis.sql
psql -U postgres rgic01 -f /usr/share/postgresql/9.4/contrib/postgis-2.2/postgis_comments.sql
psql -U postgres rgic01 -f /usr/share/postgresql/9.4/contrib/postgis-2.2/spatial_ref_sys.sql
psql -U postgres rgic01 -f /usr/share/postgresql/9.4/contrib/postgis-2.2/rtpostgis.sql
psql -U postgres rgic01 -f /usr/share/postgresql/9.4/contrib/postgis-2.2/raster_comments.sql
psql -U postgres rgic01 -f /usr/share/postgresql/9.4/contrib/postgis-2.2/topology.sql
psql -U postgres rgic01 -f /usr/share/postgresql/9.4/contrib/postgis-2.2/topology_comments.sql

# Import the SQL files
psql -U postgres rgic01 -f samples.sql
psql -U postgres rgic01 -f outliers.sql
psql -U postgres rgic01 -f zones.sql

# In the geoserver admin page, make a new workspace (if does not exist)
# Add a new PostGIS store
# Publish the imported layers (set SRID to the same as the input was; test dataset was EPSG:32631)

# The app was made using the Boundless Web App Builder QGIS plugin, copying the preview files
