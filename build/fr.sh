#!/bin/bash

# Fetch, build, move and deploy all french countries
# Usage: Copy file to your pbf2md folder, then ./fr.sh DSTFOLDER (e.g. /countries/)

if [ $# -lt 1 ]; then
  echo 1>&2 "$0: not enough arguments"
  exit 2
elif [ $# -gt 1 ]; then
  echo 1>&2 "$0: too many arguments"
  exit 2
fi

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
LANG="fr"
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
for country in "benin" "burkina-faso" "congo-brazzaville" "congo-democratic-republic" "gabon" "guinea" "ivory-coast" "mali" "niger" "senegal-and-gambia" "togo"; do
  process_country "africa" $country
done

# Europe
for country in "monaco"; do
  process_country "europe" $country
done

# Download, build and move special country regions in

# France
for region in "alsace" "aquitaine" "auvergne" "basse-normandie" "bourgogne" "bretagne" "centre" "champagne-ardenne" "corse" "franche-comte" "guadeloupe" "guyane" "haute-normandie" "ile-de-france" "languedoc-roussillon" "limousin" "lorraine" "martinique" "mayotte" "midi-pyrenees" "nord-pas-de-calais" "pays-de-la-loire" "picardie" "poitou-charentes" "provence-alpes-cote-d-azur" "reunion" "rhone-alpes"; do
  process_region "europe" "france" $region
done

