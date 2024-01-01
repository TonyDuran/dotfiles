#!/bin/bash

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

# Create backup_files directory if it doesn't exist
BACKUP_DIR="${HOME}/backup_files"
if [ ! -d "${BACKUP_DIR}" ]; then
    echo "Creating backup_files directory"
    mkdir -p "${BACKUP_DIR}"
fi

# Determine Operating System
OS="$(uname -s)"
case "$OS" in
    Darwin*)
        echo "macOS detected"
        run_scripts "os/macOS"
        ;;
    Linux*)
        echo "Linux detected"
        # Check for Debian-based Linux
        if [ -f "/etc/debian_version" ]; then
            echo "Debian-based Linux detected"
            run_scripts "os/debian"
        else
            echo "Non-Debian Linux detected, script may not be compatible"
        fi
        ;;
    *)
        echo "Unsupported OS: $OS"
        ;;
esac

echo "Now running common scripts."
run_scripts "os/shared"
