#!/bin/bash

# Define an associative array with the expected symlinks
# The key is the name of the symlink in the home directory
# The value is the target file in the dotfiles repository
declare -A symlinks=(
    [".vimrc"]="/dotfiles/config/vim/vimrc"
    [".tmux.conf"]="/dotfiles/config/tmux/tmux.conf"
    [".zshrc"]="/dotfiles/config/zsh/zshrc"
    [".gitconfig"]="/dotfiles/config/git/gitconfig"
    [".config/tmux/tmux-macosx.conf"]="/dotfiles/config/tmux/tmux-macosx.conf"
    [".config/tmux/tmux-linux.conf"]="/dotfiles/config/tmux/tmux-linux.conf"
)

# Check each symlink
for link in "${!symlinks[@]}"; do
    target="${symlinks[$link]}"
    if [[ ! -L "$HOME/$link" ]]; then
        echo "Test failed: Symlink $HOME/$link does not exist."
        exit 1
    elif [[ ! "$(readlink -f "$HOME/$link")" == "$target" ]]; then
        echo "Test failed: Symlink $HOME/$link does not point to $target."
        exit 1
    else
        echo "Test passed: Symlink $HOME/$link is correctly linked to $target."
    fi
done

echo "All symlink tests passed!"

