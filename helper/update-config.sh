#!/bin/sh
# Add new line to config.toml and commit
find . -maxdepth 1 -type d \( ! -name . \) -exec bash -c 'cd {} && sed -i "7s/$/enableGitInfo = true\n/" config.toml && git commit -am "update config.toml"' \;
