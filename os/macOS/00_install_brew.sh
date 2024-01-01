#!/bin/bash

# Source common functions
source ../../common/helpers.sh

# Rest of the script...

# Check if Homebrew is already installed using command_exists
if command_exists brew; then
    echo "Homebrew is already installed. Skipping installation."
else
    # Install Homebrew
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    if [ $? -ne 0 ]; then
        echo "Error installing Homebrew. Exiting script."
        exit 1
    fi
fi

# Read and install utilities from the shared list
while IFS= read -r utility; do
    echo "Installing $utility..."
    brew install "$utility"
    if [ $? -ne 0 ]; then
        echo "Error installing $utility."
    fi
done < "../shared/brew_utilities_list.txt"

echo "Installation process completed."
# ...

