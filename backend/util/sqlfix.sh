#!/bin/sh
# Trivial script to fix the PGDump OGR driver bug that writes uppercase column names
# even though PostgreSQL doesn't support them.
sed -i "s/OGC_FID/ogc_fid/g" $@
