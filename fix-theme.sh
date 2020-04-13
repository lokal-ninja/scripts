find . -maxdepth 1 -type d \( ! -name . \) -exec bash -c 'cd {} && sed -i "s/ln-base-en/ln-base/" config.toml && git commit -am "fix theme"' \;

