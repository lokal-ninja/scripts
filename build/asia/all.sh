# Download and build all single countries in Asia
for country in "india" "pakistan" "philippines"; do
  wget "https://download.geofabrik.de/asia/$country-latest.osm.pbf"
  ./pbf2md $country
done
