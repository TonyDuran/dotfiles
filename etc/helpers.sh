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

# Function to execute only shell scripts in a folder
run_scripts() {
    for script in "$1"/*; do
        if [ -x "$script" ] && [[ $(file --mime-type -b "$script") == "text/x-shellscript" ]]; then
            echo "Running $script"
            . "$script"
        else
            echo "Skipping $script, not an executable shell script"
        fi
    done
}
