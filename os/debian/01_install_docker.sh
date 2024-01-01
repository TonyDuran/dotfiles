#!/bin/bash

# Source the helpers from etc/helpers.sh
source ../../etc/helpers.sh

# Function to determine system architecture
get_architecture() {
    local arch
    arch=$(uname -m)
    case $arch in
        x86_64)
            echo "amd64"
            ;;
        arm64)
            echo "arm64"
            ;;
        *)
            echo "Unsupported architecture: $arch" >&2
            exit 1
            ;;
    esac
}

echo "Checking for Docker..."

# Check if Docker is installed
if command_exists docker; then
    echo "Docker is already installed."
else
    echo "Docker not found. Installing Docker..."

    # Update the apt package index
    sudo apt-get update

    # Install packages to allow apt to use a repository over HTTPS
    sudo apt-get install -y \
        apt-transport-https \
        ca-certificates \
        curl \
        gnupg-agent \
        software-properties-common

    # Add Docker’s official GPG key
    curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -

    # Determine system architecture
    ARCH=$(get_architecture)

    # Set up the stable repository based on architecture
    sudo add-apt-repository \
        "deb [arch=${ARCH}] https://download.docker.com/linux/debian $(lsb_release -cs) stable"

    # Update the apt package index again
    sudo apt-get update

    # Install the latest version of Docker Engine and containerd
    sudo apt-get install -y docker-ce docker-ce-cli containerd.io

    # Check if Docker was successfully installed
    if command_exists docker; then
        echo "Docker installed successfully."
    else
        echo "Error: Docker installation failed."
        exit 1
    fi
fi

