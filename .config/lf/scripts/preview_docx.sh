#!/usr/bin/env bash

preview_docx() {
    file_docx="$1"
    file_txt="${file_docx/%.docx/.txt}"

    # MacOS
    if command -v docx2txt.sh > /dev/null 2>&1; then
        docx2txt.sh "$file_docx" > /dev/null
        # Linux
    elif command -v  docx2txt > /dev/null 2>&1; then
        docx2txt < "$file_docx"
    else
        preview_metainfo "$file_docx"
        exit 0
    fi

    preview_text "$file_txt"
    rm "$file_txt"
}
