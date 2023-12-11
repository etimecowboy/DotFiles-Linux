#!/usr/bin/env bash

preview_md() {
	  file="$1"
	  if command -v glow > /dev/null 2>&1; then
		    glow -s dark "$file"
	  elif command -v mdcat > /dev/null 2>&1; then
		    mdcat "$file"
    else
        preview_text --language=markdown "$file"
    fi
}
