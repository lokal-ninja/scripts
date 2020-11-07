# Download and build Canada
for region in "alberta" "british-columbia" "manitoba" "new-brunswick" "newfoundland-and-labrador" "northwest-territories" "nova-scotia" "nunavut" "ontario" "prince-edward-island" "quebec" "saskatchewan" "yukon"; do
  wget "https://download.geofabrik.de/north-america/canada/$region-latest.osm.pbf";
  ./pbf2md $region
done
