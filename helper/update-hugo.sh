#!/bin/sh
# Update hugo version and commit
find . -maxdepth 1 -type d \( ! -name . \) -exec bash -c 'cd {} && sed -i "s/0.80.0/0.97.3/" .github/workflows/main.yml && git commit -am "update hugo version"' \;
