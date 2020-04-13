find . -maxdepth 1 -type d \( ! -name . \) -exec bash -c 'cd {}  && git submodule add -b en git@github.com:lokal-ninja/ln-base.git themes/ln-base && git commit -m "add theme"' \;

