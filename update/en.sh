# Update website repo of all english countries
# Copy file to your website repo folder

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# Checkout proper theme branch
cd themes/ln-base/
git checkout en
cd $DIR

# Update all branches
for branch in "au" "ca" "gh" "gb" "in" "ie" "ke" "lr" "nz" "ng" "pk" "ph" "sl" "za" "us"; do
  git checkout $branch
  git submodule update --remote --merge && git commit -am "update theme"
  git push origin $branch
done
