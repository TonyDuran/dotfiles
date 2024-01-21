#!/bin/bash

# Source helper functions
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source "$DIR/../../etc/helpers.sh"

# Path to your dotfiles repository
pushd "$(find_repo_root "$(dirname "${BASH_SOURCE[0]}")")"

# Path to the tmux configuration in your dotfiles repository
TMUX_CONFIG_SRC="${PWD}/config/tmux/tmux.conf"
TMUX_MACOS_CONFIG_SRC="${PWD}/config/tmux/tmux-macosx.conf"
TMUX_LINUX_CONFIG_SRC="${PWD}/config/tmux/tmux-linux.conf"

# Path where the tmux config should be linked in the home directory
TMUX_CONFIG_DEST="${HOME}/.tmux.conf"
TMUX_CONFIG_DIR="${HOME}/.config/tmux"

# Directory for backup files
BACKUP_DIR="${HOME}/backup_files"

# Create the ~/.config/tmux directory if it doesn't exist
if [ ! -d "${TMUX_CONFIG_DIR}" ]; then
    echo "Creating ${TMUX_CONFIG_DIR} directory..."
    mkdir -p "${TMUX_CONFIG_DIR}"
fi

# Check if tmux is installed
if command_exists tmux; then
    echo "tmux is installed. Configuring..."

    # Check if a .tmux.conf file already exists and is not a symlink
    if [ -f "${TMUX_CONFIG_DEST}" ] && [ ! -L "${TMUX_CONFIG_DEST}" ]; then
        echo "Existing .tmux.conf found. Backing up..."
        mkdir -p "${BACKUP_DIR}"
        mv "${TMUX_CONFIG_DEST}" "${BACKUP_DIR}/tmux.conf.bk"
    fi

    # Remove existing symlink to avoid conflicts
    if [ -L "${TMUX_CONFIG_DEST}" ]; then
        echo "Removing existing symlink at ${TMUX_CONFIG_DEST}"
        rm "${TMUX_CONFIG_DEST}"
    fi

    # Create a symlink to tmux.conf in the home directory
    echo "Creating symlink for tmux config"
    ln -s "${TMUX_CONFIG_SRC}" "${TMUX_CONFIG_DEST}"
    echo "tmux configuration is set up."

    # Symlink macOS and Linux specific tmux configurations
    ln -sf "${TMUX_MACOS_CONFIG_SRC}" "${TMUX_CONFIG_DIR}/tmux-macosx.conf"
    ln -sf "${TMUX_LINUX_CONFIG_SRC}" "${TMUX_CONFIG_DIR}/tmux-linux.conf"
    echo "tmux platform-specific configurations are set up."

else
    echo "tmux is not installed. Please install tmux first."
fi

popd

