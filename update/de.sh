# Update website repo of all german countries
# Copy file to your website repo folder

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# Checkout proper theme branch
cd themes/ln-base/
git checkout master
cd $DIR

# Update all branches
for branch in "master" "at" "ch"; do
  git checkout $branch
  git submodule update --remote --merge && git commit -am "update theme"
  git push origin $branch
done
