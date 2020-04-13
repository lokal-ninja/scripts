find . -maxdepth 1 -type d \( ! -name . \) -exec bash -c 'cd {} && git push origin master' \;

