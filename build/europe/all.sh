# Download and build all single countries in Europe
for country in "austria" "ireland-and-northern-ireland" "switzerland"; do
  wget "https://download.geofabrik.de/europe/$country-latest.osm.pbf"
  ./pbf2md $country
done
