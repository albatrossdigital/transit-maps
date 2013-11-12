!#/bin/bash
# Rebuilds multiple GTFS DBs
# Note, that downloading these files requires accepting multiple TOS
 
# Seattle
bash transit_map.sh gtfs.seattle.metro http://metro.kingcounty.gov/GTFS/google_transit.zip
 
# SF
bash transit_map.sh gtfs.sf.bart http://www.bart.gov/dev/schedules/google_transit.zip
bash transit_map.sh gtfs.sf.caltrain http://www.caltrain.com/Assets/GTFS/caltrain/google_transit_20130723.zip
bash transit_map.sh gtfs.sf.muni http://archives.sfmta.com/transitdata/google_transit.zip
bash transit_map.sh gtfs.sf.ferries http://trilliumtransit.com/transit_feeds/sfbay-ferries-ca-us/gtfs.zip
bash transit_map.sh gtfs.sf.marin http://www.marintransit.org/data/google_transit.zip
 
# Corvallis, OR
bash transit_map.sh gtfs.corvallis.transit ftp://ftp.ci.corvallis.or.us/pw/Transportation/GoogleTransitFeed/Google_Transit.zip
 
# NYC
bash transit_map.sh gtfs.nyc.subway http://www.mta.info/developers/data/nyct/subway/google_transit.zip
bash transit_map.sh gtfs.nyc.lirr http://www.mta.info/developers/data/lirr/google_transit.zip
bash transit_map.sh gtfs.nyc.bus.bronx http://www.mta.info/developers/data/nyct/bus/google_transit_bronx.zip
bash transit_map.sh gtfs.nyc.bus.brooklyn http://www.mta.info/developers/data/nyct/bus/google_transit_brooklyn.zip
bash transit_map.sh gtfs.nyc.bus.manhattan http://www.mta.info/developers/data/nyct/bus/google_transit_manhattan.zip
bash transit_map.sh gtfs.nyc.bus.queens http://www.mta.info/developers/data/nyct/bus/google_transit_queens.zip
bash transit_map.sh gtfs.nyc.bus.staten_island ttp://www.mta.info/developers/data/nyct/bus/google_transit_staten_island.zip
bash transit_map.sh gtfs.nyc.bus.metro_north http://www.mta.info/developers/data/mnr/google_transit.zip
 
# London
bash transit_map.sh gtfs.london.underground http://www.gtfs-data-exchange.com/agency/london-underground/latest.zip
 
# Paris
bash transit_map.sh gtfs.paris.rive_gauche http://www.gtfs-data-exchange.com/agency/paris-rive-gauche/latest.zip