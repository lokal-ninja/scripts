# Recursively remove public and resources folder for all subfolders
find . -maxdepth 1 -type d \( ! -name . \) -exec bash -c 'cd {} && rm -rf public/ && rm -rf resources/' \;
