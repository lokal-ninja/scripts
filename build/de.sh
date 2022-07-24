#!/bin/bash

# Fetch, build, move and deploy all german countries
# Usage: Copy file to your pbf2md folder, then ./de.sh DSTFOLDER (e.g. /countries/)

if [ $# -lt 1 ]; then
  echo 1>&2 "$0: not enough arguments"
  exit 2
elif [ $# -gt 1 ]; then
  echo 1>&2 "$0: too many arguments"
  exit 2
fi

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
LANG="master"
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

# Europe
for country in "austria" "switzerland"; do
  process_country "europe" $country
done

# Download, build and move special country regions in

# Germany
for region in "baden-wuerttemberg" "bayern" "brandenburg" "bremen" "hamburg" "hessen" "mecklenburg-vorpommern" "niedersachsen" "nordrhein-westfalen" "rheinland-pfalz" "saarland" "sachsen-anhalt" "sachsen" "schleswig-holstein" "thueringen"; do
  process_region "europe" "germany" $region
done

