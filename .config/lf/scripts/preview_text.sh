#!/usr/bin/env bash
#!/usr/bin/env bash

preview_text() {
    file="$1"
    shift
    if command -v bat > /dev/null 2>&1; then
        # bat --color=always --style=plain --pager=never "$file" "$@"
        bat --color=always --style=numbers --pager=never "$file" "$@"
    elif command -v batcat > /dev/null 2>&1; then
        batcat --color=always --style=numbers --pager=never "$file" "$@"
    else
        cat "$file"
    fi
}
