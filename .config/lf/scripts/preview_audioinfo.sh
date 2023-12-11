#!/usr/bin/env bash

preview_audioinfo() {
    file="$1"
    if command -v  soxi > /dev/null 2>&1; then
        soxi "$file"
    else
        preview_metainfo "$file"
    fi
}
