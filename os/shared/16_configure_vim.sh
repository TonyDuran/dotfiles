#!/bin/bash
#
# Source helper functions
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source "$DIR/../../etc/helpers.sh"

# Path to your dotfiles repository
pushd "$(find_repo_root "$(dirname "${BASH_SOURCE[0]}")")"

# Path to the Vim configuration in your dotfiles repository
VIM_CONFIG_SRC="${PWD}/config/vim/vimrc"

# Path where the Vim config should be linked in the home directory
VIM_CONFIG_DEST="${HOME}/.vimrc"

# Directory for backup files
BACKUP_DIR="${HOME}/backup_files"

echo "Configuring Vim..."

# Check if a .vimrc file already exists and is not a symlink
if [ -f "${VIM_CONFIG_DEST}" ] && [ ! -L "${VIM_CONFIG_DEST}" ]; then
    echo "Existing .vimrc found. Backing up..."
    mkdir -p "${BACKUP_DIR}"
    mv "${VIM_CONFIG_DEST}" "${BACKUP_DIR}/vimrc.bk"
fi

# Remove existing symlink to avoid conflicts
if [ -L "${VIM_CONFIG_DEST}" ]; then
    echo "Removing existing symlink at ${VIM_CONFIG_DEST}"
    rm "${VIM_CONFIG_DEST}"
fi

# Create a symlink to vimrc in the home directory
echo "Creating symlink for Vim config"
ln -s "${VIM_CONFIG_SRC}" "${VIM_CONFIG_DEST}"
echo "Vim configuration is set up."

popd
