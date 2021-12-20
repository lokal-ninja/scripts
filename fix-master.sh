#!/bin/sh
# Recursively update ln-base theme to latest version and commit for all subfolders
find . -maxdepth 1 -type d \( ! -name . \) -exec bash -c 'cd {} && cd themes/ln-base/ && git checkout en && git branch -D master && git fetch origin master && git checkout master && cd .. && cd .. && git commit -am "update theme"' \;
