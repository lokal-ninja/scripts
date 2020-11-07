# Download and build all single countries in Europe
for country in "austria" "switzerland"; do
  wget "https://download.geofabrik.de/europe/$country-latest.osm.pbf"
  ./pbf2md $country
done
