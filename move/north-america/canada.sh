# Move content and data folders for Canada
# Usage: all.sh SRCFOLDER DSTFOLDER
if [ $# -lt 2 ]; then
  echo 1>&2 "$0: not enough arguments"
  exit 2
elif [ $# -gt 2 ]; then
  echo 1>&2 "$0: too many arguments"
  exit 2
fi
for region in "alberta" "british-columbia" "manitoba" "new-brunswick" "newfoundland-and-labrador" "northwest-territories" "nova-scotia" "nunavut" "ontario" "prince-edward-island" "quebec" "saskatchewan" "yukon"; do
  rm -rf "$2/north-america/canada/$region/content/cities";
  rm -rf "$2/north-america/canada/$region/content/shops";
  mv "$1/$region/content/cities" "$2/north-america/canada/$region/content/cities";
  mv "$1/$region/content/shops" "$2/north-america/canada/$region/content/shops";
  rm -rf "$2/north-america/canada/$region/data/cities";
  mv "$1/$region/data/cities" "$2/north-america/canada/$region/data/cities";
done
