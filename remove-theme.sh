# Recursively remove theme from all subfolders
find . -maxdepth 1 -type d \( ! -name . \) -exec bash -c 'cd {} && git submodule deinit -f themes/ln-base-en && rm -rf .git/modules/themes/ln-base-en && git rm -f themes/ln-base-en && git commit -m "remove theme"' \;

