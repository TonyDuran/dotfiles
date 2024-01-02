#!/bin/bash

# Update the package index
sudo apt-get update

# Install the ca-certificates package
sudo apt-get install -y ca-certificates

# Update the CA certificates store
sudo update-ca-certificates

# Check if the CA certificates were successfully updated
if [ -f /etc/ssl/certs/ca-certificates.crt ]; then
    echo "CA certificates installed and updated successfully."
else
    echo "Error: CA certificates installation failed."
    exit 1
fi

