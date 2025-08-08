#!/bin/sh
# Update netlify deploy command and commit
find . -maxdepth 1 -type d \( ! -name . \) -exec bash -c 'cd {} && sed -i "s/--prod/--prod --no-build/" .github/workflows/main.yml && git commit -am "update netlify deploy command"' \;
