#!/bin/bash

# Source common functions
source ../../common/helpers.sh

# Path to your dotfiles repository
DOTFILES_DIR=$(find_repo_root "$(dirname "${BASH_SOURCE[0]}")")

# Path to the zsh configuration in your dotfiles repository
ZSH_CONFIG_SRC="${DOTFILES_DIR}/config/zsh/zshrc"

# Path where the zsh config should be linked in the home directory
ZSH_CONFIG_DEST="${HOME}/.zshrc"

# Directory for backup files
BACKUP_DIR="${HOME}/backup_files"

echo "Configuring Zsh..."

# Check if a .zshrc file already exists and is not a symlink
if [ -f "${ZSH_CONFIG_DEST}" ] && [ ! -L "${ZSH_CONFIG_DEST}" ]; then
    echo "Existing .zshrc found. Backing up..."
    mkdir -p "${BACKUP_DIR}"
    mv "${ZSH_CONFIG_DEST}" "${BACKUP_DIR}/zshrc.bk"
fi

# Remove existing symlink to avoid conflicts
if [ -L "${ZSH_CONFIG_DEST}" ]; then
    echo "Removing existing symlink at ${ZSH_CONFIG_DEST}"
    rm "${ZSH_CONFIG_DEST}"
fi

# Create a symlink to zshrc in the home directory
echo "Creating symlink for zsh config"
ln -s "${ZSH_CONFIG_SRC}" "${ZSH_CONFIG_DEST}"
echo "Zsh configuration is set up."

