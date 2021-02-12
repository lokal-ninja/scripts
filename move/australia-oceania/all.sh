# Move content and data folders for Australia and Oceania
# Usage: all.sh SRCFOLDER DSTFOLDER
if [ $# -lt 2 ]; then
  echo 1>&2 "$0: not enough arguments"
  exit 2
elif [ $# -gt 2 ]; then
  echo 1>&2 "$0: too many arguments"
  exit 2
fi
for country in "australia" "new-zealand"; do
  rm -rf "$2/australia-oceania/$country/content/cities";
  rm -rf "$2/australia-oceania/$country/content/shops";
  mv "$1/$country/content/cities" "$2/australia-oceania/$country/content/cities";
  mv "$1/$country/content/shops" "$2/australia-oceania/$country/content/shops";
  rm -rf "$2/australia-oceania/$country/data/cities";
  mv "$1/$country/data/cities" "$2/australia-oceania/$country/data/cities";
done
