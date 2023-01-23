#!/bin/sh

set -eu

download=y
target=${1:-/usr/local/bin/docker.sh}

mkdir -p "$(dirname "$target")"

if [ "$(basename "$0")" = "install.sh" ]; then
    file="$(dirname "$0")/docker.sh"
    if [ -f "$file" ]; then
        cp "$file" "$target" && download=n
    fi
fi

[ $download = y ] && curl -sSLfo "$target" https://raw.githubusercontent.com/win-t/docker-sh/master/docker.sh
chmod 755 "$target"

exit 0
