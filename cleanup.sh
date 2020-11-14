# Recursively update ln-base theme to latest version and commit for all subfolders
find . -maxdepth 1 -type d \( ! -name . \) -exec bash -c 'cd {} && rm -rf public/ && rm -rf resources/' \;
