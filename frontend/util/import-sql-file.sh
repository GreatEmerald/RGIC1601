#!/bin/sh
# Simple example of how to import the generated SQL script (when the DB "rgic01" already exists)
psql -U postgres rgic01 -f $@
