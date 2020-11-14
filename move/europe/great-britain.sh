# Move content and data folders for Great Britain
# Usage: all.sh SRCFOLDER DSTFOLDER
if [ $# -lt 2 ]; then
  echo 1>&2 "$0: not enough arguments"
  exit 2
elif [ $# -gt 2 ]; then
  echo 1>&2 "$0: too many arguments"
  exit 2
fi
for region in "england" "scotland" "wales"; do
  rm -rf "$2/europe/great-britain/$region/content/cities";
  mv "$1/$region/content/cities" "$2/europe/great-britain/$region/content/cities";
  rm -rf "$2/europe/great-britain/$region/data/cities";
  mv "$1/$region/data/cities" "$2/europe/great-britain/$region/data/cities";
done
