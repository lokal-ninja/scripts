find . -maxdepth 1 -type d \( ! -name . \) -exec bash -c 'cd {} && git submodule update --remote --merge && git commit -m "update theme"' \;

