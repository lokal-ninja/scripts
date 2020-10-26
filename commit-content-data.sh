# Recursively add and commit in all subfolders
find . -maxdepth 1 -type d \( ! -name . \) -exec bash -c 'cd {} && git add -A && git commit -m "update content and data"' \;

