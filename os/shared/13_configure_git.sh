#!/bin/bash

# Source helper functions
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source "$DIR/../../etc/helpers.sh"

# Path to your dotfiles repository
pushd $(find_repo_root "$(dirname "${BASH_SOURCE[0]}")")

# Path to the git configuration in your dotfiles repository
GIT_CONFIG_SRC="${PWD}/config/git/gitconfig"

# Path where the git config should be linked in the home directory
GIT_CONFIG_DEST="${HOME}/.gitconfig"

# Directory for backup files
BACKUP_DIR="${HOME}/backup_files"

echo "Configuring Git..."

# Check if a .gitconfig file already exists and is not a symlink
if [ -f "${GIT_CONFIG_DEST}" ] && [ ! -L "${GIT_CONFIG_DEST}" ]; then
    echo "Existing .gitconfig found. Backing up..."
    mkdir -p "${BACKUP_DIR}"
    mv "${GIT_CONFIG_DEST}" "${BACKUP_DIR}/gitconfig.bk"
fi

# Remove existing symlink to avoid conflicts
if [ -L "${GIT_CONFIG_DEST}" ]; then
    echo "Removing existing symlink at ${GIT_CONFIG_DEST}"
    rm "${GIT_CONFIG_DEST}"
fi

# Create a symlink to gitconfig in the home directory
echo "Creating symlink for git config"
ln -s "${GIT_CONFIG_SRC}" "${GIT_CONFIG_DEST}"
echo "Git configuration is set up."

popd
