# Add README.md to all subfolders
find . -maxdepth 1 -type d \( ! -name . \) -exec bash -c 'cd {}  && echo -e "Regional shoogle page. Auto-generated with https://github.com/lokal-ninja/ln-base theme\n" >> README.md && git add -A && git commit -m "add README.md"' \;
