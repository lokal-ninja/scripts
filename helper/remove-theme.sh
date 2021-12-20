#!/bin/sh
# Recursively remove theme from all subfolders
find . -maxdepth 1 -type d \( ! -name . \) -exec bash -c 'cd {} && git submodule deinit -f themes/ln-base && rm -rf .git/modules/themes/ln-base && git rm -f themes/ln-base && git commit -am "remove theme"' \;
