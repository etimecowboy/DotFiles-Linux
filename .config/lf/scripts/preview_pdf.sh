#!/usr/bin/env bash

preview_pdf() {
    file="$1"

    if [[ "$TERM" =~ .*tmux.* ]]; then
        preview_metainfo "$file"
        exit 1
    fi

    if command -v pdftoppm > /dev/null 2>&1; then
        if [ ! -f "${CACHE}.jpg" ]; then
            pdftoppm -jpeg -f 1 -singlefile "$file" "$CACHE"
        fi
        preview_image "${CACHE}.jpg" "$2" "$3" "$4" "$5"
    else
        preview_metainfo "$file"
    fi
}
