#!/usr/bin/env bash

preview_doc() {
    file="$1"
    if command -v catdoc > /dev/null 2>&1; then
        catdoc "$file"
    elif command -v textutil > /dev/null 2>&1; then
        textutil -stdout -cat txt "$file" | \
            # bat --color=always --style=numbers --pager=never
            preview_text "$file"
    fi
}
