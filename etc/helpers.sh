#!/bin/bash

# Function to check if a command exists
command_exists() {
    command -v "$1" &> /dev/null
}

find_repo_root() {
    local dir=$1
    while [[ $dir != / ]]; do
        if [[ -d "$dir/.git" ]]; then
            echo "$dir"
            return
        fi
        dir=$(dirname "$dir")
    done
    echo "Error: Unable to find the root of the repository." >&2
    exit 1
}
