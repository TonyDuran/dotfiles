#!/bin/bash

# Load Zsh as an interactive shell
zsh -i -c '

# Source the .zshrc file
source $HOME/.zshrc

# Check if the specific alias is set
alias_name="hello_world"
if alias $alias_name >/dev/null 2>&1; then
    echo "Alias test passed: Alias '"'"'$alias_name'"'"' is loaded."
else
    echo "Alias test failed: Alias '"'"'$alias_name'"'"' is not loaded."
    exit 1
fi
'

