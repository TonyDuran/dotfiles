#!/bin/bash

# Identify the operating system
OS=$(uname)

# Check if the OS is macOS
if [ "$OS" = "Darwin" ]; then
    echo "Operating System is macOS."

    # Check for Homebrew
    if which brew >/dev/null; then
        echo "Homebrew is installed."
    else
	#TODO: Install homebrew
        echo "Homebrew is not installed."
    fi
else
    # TODO: add functionality for the remaining OS's
    echo "Operating System is not macOS."
fi
