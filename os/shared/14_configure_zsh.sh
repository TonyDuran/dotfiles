#!/bin/bash

# Source helper functions
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source "$DIR/../../etc/helpers.sh"


# Path to your dotfiles repository
pushd $(find_repo_root "$(dirname "${BASH_SOURCE[0]}")")
# Find the root directory of the dotfiles repository
# Path to the aliases file in your dotfiles repository
ALIASES_SRC="${PWD}/config/zsh/aliases"
# Path where the .aliases file should be linked in the home directory
ALIASES_DEST="${HOME}/.aliases"
# Path to the export file in your dotfiles repository
EXPORTS_SRC="${PWD}/config/zsh/exports"
# Path where the .exports file should be linked in the home directory
EXPORTS_DEST="${HOME}/.exports"
#
# Path to the zsh configuration in your dotfiles repository
ZSH_CONFIG_SRC="${PWD}/config/zsh/zshrc"
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

echo "Setting up aliases file"
# Check if a .aliases file already exists and is not a symlink
if [ -f "${ALIASES_DEST}" ] && [ ! -L "${ALIASES_DEST}" ]; then
    echo "Existing .aliases file found. Backing up..."
    mv "${ALIASES_DEST}" "${ALIASES_DEST}.bk"
fi

echo "Setting up exports file"
# Check if a .aliases file already exists and is not a symlink
if [ -f "${EXPORTS_DEST}" ] && [ ! -L "${EXPORTS_DEST}" ]; then
    echo "Existing .aliases file found. Backing up..."
    mv "${EXPORTS_DEST}" "${EXPORTS_DEST}.bk"
fi



# Remove existing symlink to avoid conflicts
if [ -L "${ALIASES_DEST}" ]; then
    rm "${ALIASES_DEST}"
fi

# Remove existing symlink to avoid conflicts
if [ -L "${EXPORTS_DEST}" ]; then
    rm "${EXPORTS_DEST}"
fi


# Create a new symlink for the aliases file
ln -s "${ALIASES_SRC}" "${ALIASES_DEST}"
ln -s "${EXPORTS_SRC}" "${EXPORTS_DEST}"

popd
