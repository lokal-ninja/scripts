#!/bin/sh
# Append / to baseURL
find . -maxdepth 1 -type d \( ! -name . \) -exec bash -c 'cd {} && sed -i "1s/.$/\/\"/" config.toml && git commit -am "update config.toml"' \;
