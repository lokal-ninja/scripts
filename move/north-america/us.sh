# Move content and data folders for United States
# Usage: all.sh SRCFOLDER DSTFOLDER
if [ $# -lt 2 ]; then
  echo 1>&2 "$0: not enough arguments"
  exit 2
elif [ $# -gt 2 ]; then
  echo 1>&2 "$0: too many arguments"
  exit 2
fi
for region in "alabama" "alaska" "arizona" "arkansas" "california" "colorado" "connecticut" "delaware" "district-of-columbia" "florida" "georgia" "hawaii" "idaho" "illinois" "indiana" "iowa" "kansas" "kentucky" "louisiana" "maine" "maryland" "massachusetts" "michigan" "minnesota" "mississippi" "missouri" "montana" "nebraska" "nevada" "new-hampshire" "new-jersey" "new-mexico" "new-york" "north-carolina" "north-dakota" "ohio" "oklahoma" "oregon" "pennsylvania" "puerto-rico" "rhode-island" "south-carolina" "south-dakota" "tennessee" "texas" "utah" "vermont" "virginia" "washington" "west-virginia" "wisconsin" "wyoming"; do
  rm -rf "$2/north-america/us/$region/content/cities";
  rm -rf "$2/north-america/us/$region/content/shops";
  mv "$1/$region/content/cities" "$2/north-america/us/$region/content/cities";
  mv "$1/$region/content/shops" "$2/north-america/us/$region/content/shops";
  rm -rf "$2/north-america/us/$region/data/cities";
  mv "$1/$region/data/cities" "$2/north-america/us/$region/data/cities";
done
