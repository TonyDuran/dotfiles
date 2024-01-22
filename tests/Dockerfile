# Use a Debian base image
FROM debian:latest

# Avoid prompts from apt
ENV DEBIAN_FRONTEND=noninteractive

# Copy your dotfiles repository into the Docker image
COPY . /dotfiles

# Set working directory
WORKDIR /dotfiles

# Set the executable bit on the scripts
# RUN chmod +x /dotfiles/installer.sh \
#     && find /dotfiles -name "*.sh" -exec chmod +x {} \;

# Run the installer script (adjust this if your installer requires arguments)
 CMD ./installer.sh && ./tests/verify_symlinks.sh && ./tests/test_aliases.sh
