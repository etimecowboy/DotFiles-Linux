#!/usr/bin/env bash

preview_metainfo() {
    file="$1"
    if command -v  exiftool > /dev/null 2>&1; then
        exiftool "$file"
    else
        echo "No META data"
        exit 1
    fi
}
