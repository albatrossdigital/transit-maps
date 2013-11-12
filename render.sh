!#/bin/bash
# example call:
# $ bash render.sh /root/scripts/transit-maps/Tilemill/my-project
 
TILEMILL_PROJECT_DIR="$1"

./$TRANSIT_MAPS_BASE/lib/projectmill/index.js -f --render -c $TRANSIT_MAPS_BASE/Tilemill/$TILEMILL_PROJECT_DIR/projectmill.json -t /usr/share/tilemill/
