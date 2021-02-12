# Add new line to config.toml and commit
find . -maxdepth 1 -type d \( ! -name . \) -exec bash -c 'cd {} && sed -i "6s/disableKinds = .*/disableKinds = [\"RSS\", \"robotsTXT\"]/" config.toml && echo "" >> config.toml && echo "[taxonomies]" >> config.toml && echo "  shop = \"shops\"" >> config.toml && echo "" >> config.toml && git commit -am "update config.toml"' \;
