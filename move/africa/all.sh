# Move content and data folders for Africa
# Usage: all.sh SRCFOLDER DSTFOLDER
if [ $# -lt 2 ]; then
  echo 1>&2 "$0: not enough arguments"
  exit 2
elif [ $# -gt 2 ]; then
  echo 1>&2 "$0: too many arguments"
  exit 2
fi
for country in "ghana" "kenya" "liberia" "nigeria" "sierra-leone" "south-africa"; do
  rm -rf "$2/africa/$country/content/cities";
  mv "$1/$country/content/cities" "$2/africa/$country/content/cities";
  rm -rf "$2/africa/$country/data/cities";
  mv "$1/$country/data/cities" "$2/africa/$country/data/cities";
done
