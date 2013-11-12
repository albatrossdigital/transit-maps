!#/bin/bash

# Install projectmill
mkdir lib
cd lib
git clone https://github.com/mapbox/projectmill.git

# Setup symlinks
GTFS_TILEMILL=gtfs_sf
ln -s $TRANSIT_MAPS_BASE/$GTFS_TILEMILL $MAPBOX_PROJECTS/$GTFS_TILEMILL
GTFS_TILEMILL=gtfs_seattle
ln -s $TRANSIT_MAPS_BASE/$GTFS_TILEMILL $MAPBOX_PROJECTS/$GTFS_TILEMILL
GTFS_TILEMILL=gtfs_corvallis
ln -s $TRANSIT_MAPS_BASE/$GTFS_TILEMILL $MAPBOX_PROJECTS/$GTFS_TILEMILL