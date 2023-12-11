#!/usr/bin/env bash

preview_html() {
    file="$1"

    if [[ "$TERM" =~ .*tmux.* ]]; then
        preview_metainfo "$file"
        exit 1
    fi

    if command -v wkhtmltopdf > /dev/null 2>&1; then
        if command -v pdftoppm > /dev/null 2>&1; then
            if [ ! -f "$CACHE" ]; then
                wkhtmltopdf "$file" - | pdftoppm -jpeg -f 1 -singlefile - "$CACHE"
            fi
            preview_image "${CACHE}.jpg" "$2" "$3" "$4" "$5"
        else
            preview_text "$file"
        fi
    elif command -v w3m > /dev/null 2>&1; then
        w3m -dump "$file"
    else
        preview_metainfo "$file"
    fi
}
