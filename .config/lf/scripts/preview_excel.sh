#!/usr/bin/env bash

preview_excel() {
    file="$1"
    if command -v  ssconvert > /dev/null 2>&1; then
        ssconvert --export-type=Gnumeric_stf:stf_csv "$file" "fd://1" | \
            preview_text --language=csv
    else
        preview_metainfo "$file"
    fi
}
