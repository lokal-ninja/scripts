#!/bin/sh
# Recursively fix origin of all subfolders
find . -maxdepth 1 -type d \( ! -name . \) -exec bash -c 'cd {} && git remote set-url origin $(echo "git@github.com:lokal-ninja/$(basename {}).git")' \;
