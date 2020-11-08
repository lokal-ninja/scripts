# Download and build all single countries in Australia and Oceania
for country in "australia" "new-zealand"; do
  wget "https://download.geofabrik.de/australia-oceania/$country-latest.osm.pbf"
  ./pbf2md $country
done
