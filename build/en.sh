#!/bin/bash

# Fetch, build, move and deploy all english countries
# Usage: Copy file to your pbf2md folder, then ./en.sh DSTFOLDER (e.g. /countries/)

if [ $# -lt 1 ]; then
  echo 1>&2 "$0: not enough arguments"
  exit 2
elif [ $# -gt 1 ]; then
  echo 1>&2 "$0: too many arguments"
  exit 2
fi

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
LANG="en"
DST=$1

update () {
  git pull origin master
  git submodule update --remote --merge && git commit -am "update theme"
}

push () {
  git add -A && git commit -m "update content and data"
  git push origin master
}

process_country () {
  wget "https://download.geofabrik.de/$1/$2-latest.osm.pbf" || continue
  ./pbf2md $2
  cd "$DST/$LANG/$2"
  update
  cd $DIR
  rm -rf "$DST/$LANG/$2/content/cities"
  rm -rf "$DST/$LANG/$2/content/shops"
  mv "$2/content/cities" "$DST/$LANG/$2/content/cities"
  mv "$2/content/shops" "$DST/$LANG/$2/content/shops"
  rm -rf "$DST/$LANG/$2/data/cities"
  mv "$2/data/cities" "$DST/$LANG/$2/data/cities"
  cd "$DST/$LANG/$2"
  push
  cd $DIR
  rm -rf "$2"
  rm "$2-latest.osm.pbf"
}

process_region () {
  wget "https://download.geofabrik.de/$1/$2/$3-latest.osm.pbf" || continue
  ./pbf2md $3
  cd "$DST/$LANG/$2/$3"
  update
  cd $DIR
  rm -rf "$DST/$LANG/$2/$3/content/cities"
  rm -rf "$DST/$LANG/$2/$3/content/shops"
  mv "$3/content/cities" "$DST/$LANG/$2/$3/content/cities"
  mv "$3/content/shops" "$DST/$LANG/$2/$3/content/shops"
  rm -rf "$DST/$LANG/$2/$3/data/cities"
  mv "$3/data/cities" "$DST/$LANG/$2/$3/data/cities"
  cd "$DST/$LANG/$2/$3"
  push
  cd $DIR
  rm -rf "$3"
  rm "$3-latest.osm.pbf"
}

# Use proper branch
git checkout $LANG
go build

# Download and build single countries in

# Africa
for country in "ghana" "kenya" "liberia" "nigeria" "sierra-leone" "south-africa"; do
  process_country "africa" $country
done

# Asia
for country in "india" "pakistan" "philippines"; do
  process_country "asia" $country
done

# Australia-Oceania
for country in "australia" "new-zealand"; do
  process_country "australia-oceania" $country
done

# Europe
for country in "ireland-and-northern-ireland"; do
  process_country "europe" $country
done

# Download, build and move special country regions in

# United Kingdom
for region in "england" "scotland" "wales"; do
  process_region "europe" "united-kingdom" $region
done

# Canada
for region in "alberta" "british-columbia" "manitoba" "new-brunswick" "newfoundland-and-labrador" "northwest-territories" "nova-scotia" "nunavut" "ontario" "prince-edward-island" "quebec" "saskatchewan" "yukon"; do
  process_region "north-america" "canada" $region
done

# United States
for region in "alabama" "alaska" "arizona" "arkansas" "california" "colorado" "connecticut" "delaware" "district-of-columbia" "florida" "georgia" "hawaii" "idaho" "illinois" "indiana" "iowa" "kansas" "kentucky" "louisiana" "maine" "maryland" "massachusetts" "michigan" "minnesota" "mississippi" "missouri" "montana" "nebraska" "nevada" "new-hampshire" "new-jersey" "new-mexico" "new-york" "north-carolina" "north-dakota" "ohio" "oklahoma" "oregon" "pennsylvania" "puerto-rico" "rhode-island" "south-carolina" "south-dakota" "tennessee" "texas" "utah" "vermont" "virginia" "washington" "west-virginia" "wisconsin" "wyoming"; do
  process_region "north-america" "us" $region
done
