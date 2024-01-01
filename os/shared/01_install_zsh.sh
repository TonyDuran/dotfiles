#!/bin/bash

# Path to the Oh My Zsh installation
OH_MY_ZSH_DIR="${HOME}/.oh-my-zsh"

echo "Checking for Oh My Zsh installation..."

# Check if Oh My Zsh is installed
if [ ! -d "${OH_MY_ZSH_DIR}" ]; then
    echo "Oh My Zsh is not installed. Installing now..."

    # Install Oh My Zsh
    #sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" CHSH=no RUNZSH=no
    echo "y" | sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"



    # Check if the installation was successful
    if [ ! -d "${OH_MY_ZSH_DIR}" ]; then
        echo "Error: Oh My Zsh installation failed."
        exit 1
    else
        echo "Oh My Zsh installed successfully."
    fi
else
    echo "Oh My Zsh is already installed."
fi

