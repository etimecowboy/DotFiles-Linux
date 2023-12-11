#!/usr/bin/env bash

preview_video () {
    file=$1

    if [[ "$TERM" =~ .*tmux.* ]]; then
        preview_videoinfo "$file"
        exit 1
    fi

    if command -v ffmpegthumbnailer > /dev/null 2>&1; then
        if [ ! -f "${CACHE}.jpg" ]; then
            ffmpegthumbnailer -i "$file" -o "${CACHE}.jpg" -s 0 -q 5
        fi
        preview_image "${CACHE}.jpg" "$2" "$3" "$4" "$5"
    else
        preview_videoinfo "$file"
    fi
}
