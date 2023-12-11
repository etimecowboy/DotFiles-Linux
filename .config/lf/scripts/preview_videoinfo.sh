#!/usr/bin/env bash

preview_videoinfo() {
    file="$1"
    if command -v  mediainfo > /dev/null 2>&1; then
        mediainfo "$file"
    else
        preview_metainfo "$file"
    fi
}
