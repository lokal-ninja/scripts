# Move content folders
# Usage: move-content-dach.sh SRCFOLDER DSTFOLDER
if [ $# -lt 2 ]; then
  echo 1>&2 "$0: not enough arguments"
  exit 2
elif [ $# -gt 2 ]; then
  echo 1>&2 "$0: too many arguments"
  exit 2
fi

mv "$2/oesterreich" "$2/austria"
mv "$2/schweiz" "$2/switzerland"

for region in "austria" "baden-wuerttemberg" "bayern" "brandenburg" "bremen" "hamburg" "hessen" "mecklenburg-vorpommern" "niedersachsen" "nordrhein-westfalen" "rheinland-pfalz" "saarland" "sachsen-anhalt" "sachsen" "schleswig-holstein" "switzerland" "thueringen"; do
  rm -rf "$2/$region/content/cities";
  mv "$1/$region/content/cities" "$2/$region/content/cities";
done

mv "$2/austria" "$2/oesterreich"
mv "$2/switzerland" "$2/schweiz"

