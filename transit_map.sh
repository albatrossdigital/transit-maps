!#/bin/bash
# example call:
# $ bash transit_map.sh gtfs.seattle.metro http://metro.kingcounty.gov/GTFS/google_transit.zip

TRANSIT_MAPS_BASE=/root/scripts/transit_maps
MAPBOX_PROJECTS=/root/Documents/MapBox/project
 
GTFS_DB="$1"
GTFS_URL="$2"
 
psql -U postgres -c "drop database if exists \"$GTFS_DB\";"
psql -U postgres -c "create database \"$GTFS_DB\";"
psql -U postgres -d "$GTFS_DB" -c "create language plpgsql;"
psql -U postgres -d "$GTFS_DB" -f /usr/share/postgresql/9.1/contrib/postgis-1.5/postgis.sql
psql -U postgres -d "$GTFS_DB" -f /usr/share/postgresql/9.1/contrib/postgis-1.5/spatial_ref_sys.sql
Load in data with gtfsdb
 
gtfsdb-load --database_url postgresql://postgres@localhost/$GTFS_DB --is_geospatial http://metro.kingcounty.gov/GTFS/google_transit.zip
 
psql -U postgres -d $GTFS_DB
ALTER TABLE routes DROP CONSTRAINT routes_pkey CASCADE;
ALTER TABLE routes ADD COLUMN id SERIAL primary key;
ALTER TABLE stops DROP CONSTRAINT stops_pkey CASCADE;
ALTER TABLE stops ADD COLUMN id SERIAL primary key;
ALTER TABLE patterns DROP CONSTRAINT patterns_pkey CASCADE;
ALTER TABLE patterns ADD COLUMN id SERIAL primary key;
\q

ln -s $TRANSIT_MAPS_BASE/$GTFS_DB $MAPBOX_PROJECTS/$GTFS_DB