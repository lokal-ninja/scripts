# Move content and data folders for Asia
# Usage: all.sh SRCFOLDER DSTFOLDER
if [ $# -lt 2 ]; then
  echo 1>&2 "$0: not enough arguments"
  exit 2
elif [ $# -gt 2 ]; then
  echo 1>&2 "$0: too many arguments"
  exit 2
fi
for country in "india" "pakistan" "philippines"; do
  rm -rf "$2/asia/$country/content/cities";
  rm -rf "$2/asia/$country/content/shops";
  mv "$1/$country/content/cities" "$2/asia/$country/content/cities";
  mv "$1/$country/content/shops" "$2/asia/$country/content/shops";
  rm -rf "$2/asia/$country/data/cities";
  mv "$1/$country/data/cities" "$2/asia/$country/data/cities";
done
