# Download and build Great Britain
for region in "england" "scotland" "wales"; do
  wget "https://download.geofabrik.de/europe/great-britain/$region-latest.osm.pbf";
  ./pbf2md $region
done
