#!/bin/sh
# Update website repo of all french countries
# Copy file to your website repo folder

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# Checkout proper theme branch
cd themes/ln-base/
git checkout fr
cd $DIR

# Update all branches
for branch in "bj" "bf" "cg" "cd" "fr" "ga" "gn" "ci" "ml" "mc" "ne" "sn" "tg"; do
  git checkout $branch
  git submodule update --remote --merge && git commit -am "update theme"
  git push origin $branch
done
