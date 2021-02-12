# Move content and data folders for Germany
# Usage: all.sh SRCFOLDER DSTFOLDER
if [ $# -lt 2 ]; then
  echo 1>&2 "$0: not enough arguments"
  exit 2
elif [ $# -gt 2 ]; then
  echo 1>&2 "$0: too many arguments"
  exit 2
fi
for region in "baden-wuerttemberg" "bayern" "brandenburg" "bremen" "hamburg" "hessen" "mecklenburg-vorpommern" "niedersachsen" "nordrhein-westfalen" "rheinland-pfalz" "saarland" "sachsen-anhalt" "sachsen" "schleswig-holstein" "thueringen"; do
  rm -rf "$2/europe/germany/$region/content/cities";
  rm -rf "$2/europe/germany/$region/content/shops";
  mv "$1/$region/content/cities" "$2/europe/germany/$region/content/cities";
  mv "$1/$region/content/shops" "$2/europe/germany/$region/content/shops";
  rm -rf "$2/europe/germany/$region/data/cities";
  mv "$1/$region/data/cities" "$2/europe/germany/$region/data/cities";
done
