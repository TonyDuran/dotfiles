#!/bin/bash

# Function to check if a command exists
command_exists() {
    command -v "$1" &> /dev/null
}

# Function to determine Linux distribution
get_distro() {
    local distro
    distro=$(lsb_release -is)
    echo "$distro"
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


# Function to execute scripts in a folder
run_scripts() {
    for script in "$1"/*; do
        # Check if the file is executable
        if [ -x "$script" ]; then
            # Check if the file starts with a shebang
            if head -n 1 "$script" | grep -q -E '^#!'; then
                echo "Running $script"
                . "$script"
            else
                echo "Skipping $script, does not start with a shebang"
            fi
        else
            echo "Skipping $script, not an executable shell script"
        fi
    done
}

