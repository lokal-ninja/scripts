# Move content and data folders for Europe
# Usage: all.sh SRCFOLDER DSTFOLDER
if [ $# -lt 2 ]; then
  echo 1>&2 "$0: not enough arguments"
  exit 2
elif [ $# -gt 2 ]; then
  echo 1>&2 "$0: too many arguments"
  exit 2
fi
for country in "austria" "ireland-and-northern-ireland" "switzerland"; do
  rm -rf "$2/europe/$country/content/cities";
  rm -rf "$2/europe/$country/content/shops";
  mv "$1/$country/content/cities" "$2/europe/$country/content/cities";
  mv "$1/$country/content/shops" "$2/europe/$country/content/shops";
  rm -rf "$2/europe/$country/data/cities";
  mv "$1/$country/data/cities" "$2/europe/$country/data/cities";
done
