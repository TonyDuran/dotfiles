# Use a Debian base image
FROM debian:latest

# Avoid prompts from apt
ENV DEBIAN_FRONTEND=noninteractive

# Install necessary packages (like git, curl, zsh, etc.)
RUN apt-get update && apt-get install -y \
    git \
    curl \
    zsh \
    sudo \
    --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

# Copy your dotfiles repository into the Docker image
COPY . /dotfiles

# Set working directory
WORKDIR /dotfiles

# Run the installer script (adjust this if your installer requires arguments)
CMD ["./installer.sh"]

