#!/usr/bin/env bash

preview_epub() {
    file="$1"

    if [[ "$TERM" =~ .*tmux.* ]]; then
        preview_metainfo "$file"
        exit 1
    fi

    if command -v  epub-thumbnailer > /dev/null 2>&1; then
        if [ ! -f "$CACHE" ]; then
            epub-thumbnailer "$file" "$CACHE" 1024
        fi
        preview_image "$CACHE" "$2" "$3" "$4" "$5"
    elif command -v  gnome-epub-thumbnailer > /dev/null 2>&1; then
        if [ ! -f "$CACHE" ]; then
            gnome-epub-thumbnailer -s 1024 "$file" "$CACHE"
        fi
        preview_image "$CACHE" "$2" "$3" "$4" "$5"
    else
        preview_metainfo "$file"
    fi
}
