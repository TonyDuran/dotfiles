#!/bin/bash

# Source the .zshrc file
source "${HOME}/.zshrc"

# Test for a specific alias - replace 'myalias' with an actual alias from your file
if type hello_world &>/dev/null; then
    echo "Alias 'hello_world' is loaded."
else
    echo "Test failed: Alias 'hello_world' is not loaded."
    exit 1
fi

