# dotfiles

## Purpose
Version Control dotfiles and other important configuration files used in workflow.


#### Future items/goals:
* zsh/bash profiles
* text file including all other tools normally used
* Bash script to configure VS Code, tmux, vim, etc
* Bash script to install tools/dependencies based on OS (adapted for arch/debian/centOS/Mac - hopefully)
* python script to move/manage config files
* script adds symlinks from repo to normal file location (for ex: .tmux.conf inside repo will symlink to $HOME/.tmux.conf)

dotfiles/
│
├── installer.sh        # The main installation script
│
├── os/                 # OS-specific scripts and configurations
│   ├── debian/         # Debian Linux specific scripts and configs
│   └── macOS/          # macOS specific scripts and configs
│
├── config/             # Configuration files for various tools and applications
│   ├── git/            # Git configuration (e.g., .gitconfig, .gitignore_global)
│   ├── vim/            # Vim configuration (e.g., .vimrc, .vim/)
│   ├── zsh/            # Zsh configuration (e.g., .zshrc, custom themes)
│   ├── tmux/           # Tmux configuration (e.g., .tmux.conf)
│   └── [other tools]/  # Other tool-specific configurations
│
├── scripts/            # Utility scripts (not specific to any OS)
│
├── common/             # Common resources and scripts
│
├── README.md           # Documentation explaining your dotfiles, setup, etc.
│
└── .gitignore          # Gitignore to exclude unnecessary files from the repo

