#!/bin/bash

# Update the package index
apt-get update && apt-get install -y \
    git \
    curl \
    zsh \
    sudo \
    --no-install-recommends

apt-get install -y tmux
apt-get install -y xclip


echo "Installing Lunar Vim Dependencies"
echo "===================="
echo "installing rust up"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# TODO: lunar vim deps. Need to fix before installing
# apt-get install -y git make pip python3 nodejs npm
