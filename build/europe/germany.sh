# Download and build Germany
for region in "baden-wuerttemberg" "bayern" "brandenburg" "bremen" "hamburg" "hessen" "mecklenburg-vorpommern" "niedersachsen" "nordrhein-westfalen" "rheinland-pfalz" "saarland" "sachsen-anhalt" "sachsen" "schleswig-holstein" "thueringen"; do
  wget "https://download.geofabrik.de/europe/germany/$region-latest.osm.pbf";
  ./pbf2md $region
done

