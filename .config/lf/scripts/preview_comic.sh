#!/usr/bin/env bash

preview_comic() {
    file="$1"

    if [[ "$TERM" =~ .*tmux.* ]]; then
        preview_metainfo "$file"
        exit 1
    fi

    if command -v comicthumb > /dev/null 2>&1; then
        if [ ! -f "$CACHE" ]; then
            comicthumb "$file" "$CACHE" 1024
        fi
        preview_image "$CACHE" "$2" "$3" "$4" "$5"
    else
        preview_metainfo "$file"
    fi
}
