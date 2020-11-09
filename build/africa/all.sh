# Download and build all single countries in Africa
for country in "ghana" "kenya" "liberia" "nigeria" "sierra-leone" "south-africa"; do
  wget "https://download.geofabrik.de/africa/$country-latest.osm.pbf"
  ./pbf2md $country
done
