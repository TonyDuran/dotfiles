#!/bin/bash

# Get the directory of the current script
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# Build the Docker image
docker build -t dotfiles-test -f "$SCRIPT_DIR/Dockerfile" "$SCRIPT_DIR/.."

# Run the Docker container
docker run --name dotfiles-container dotfiles-test

# Check the exit code of the installer script
EXIT_CODE=$(docker inspect dotfiles-container --format='{{.State.ExitCode}}')


if [ "$EXIT_CODE" -eq 0 ]; then
    echo "Test passed: The installer script completed successfully."
else
    echo "Test failed: The installer script encountered an error."
fi

# Remove the Docker container after running the tests
docker rm dotfiles-container &> /dev/null
