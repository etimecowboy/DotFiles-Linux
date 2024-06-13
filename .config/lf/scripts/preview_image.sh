#!/usr/bin/env bash

preview_image() {
    file=$1

    if [[ "$TERM" =~ .*kitty.* ]]; then
        if command -v kitten > /dev/null 2>&1 ; then
            w=$2
            h=$3
            x=$4
            y=$5

            # Rescale the image
            w=$(( w * 99 / 100 ))
            h=$(( h * 99 / 100 ))
            y=$(( y + 1 ))

            if [[ "$( file -Lb --mime-type "$file")" =~ ^image ]]; then
                # kitty +icat --silent --transfer-mode file --place "${w}x${h}@${x}x${y}" "$file"
                kitten icat --transfer-mode file --stdin no --place "${w}x${h}@${x}x${y}" "$file" < /dev/null > /dev/tty
                exit 1
            fi
        fi
    fi

    if [[ "$TERM" =~ .*xterm.*
            || "$TERM" =~ .*foot.*
            # || "$TERM" =~ .*eat.* # FIXME: LF cannot display sixel properly in emacs-eat
            # || "$TERM" =~ .*wez.* # TODO: NOT tested it yet.
        ]]; then
        if command -v chafa > /dev/null 2>&1 ; then
	          geometry="$(($2-2))x$3"
            chafa "$1" -f sixel -s "$geometry" --animate off --polite on
            exit 1
        fi
    fi

    # pistol "$file"
    preview_metainfo "$file"
}
