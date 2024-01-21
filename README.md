![example workflow](https://github.com/TonyDuran/dotfiles/actions/workflows/github-actions.yml/badge.svg)
# dotfiles

## Purpose
Version Control dotfiles and other important configuration files used in workflow.

### TODO:
- Test on MacOS (possibly VM)
- move exports to separate file same as aliases
- ??
    - keep up-to-date
    - maybe add utilities with gh gists
    - get a windows workflow (probably with WSL)
    - add more customization

```
dotfiles/
│
├── installer.sh        # The main installation script
│
├── os/                 # OS-specific scripts and configurations
│   ├── debian/         # Debian Linux specific scripts and configs
│   └── macOS/          # macOS specific scripts and configs
│   └── shared/         # common scripts and configs
│
├── config/             # Configuration files for various tools and applications
│   ├── git/            # Git configuration (e.g., .gitconfig, .gitignore_global)
│   ├── vim/            # Vim configuration (e.g., .vimrc, .vim/)
│   ├── zsh/            # Zsh configuration (e.g., .zshrc, custom themes)
│   ├── tmux/           # Tmux configuration (e.g., .tmux.conf)
│   └── [other tools]/  # Other tool-specific configurations
│
├── scripts/            # Utility/Helper scripts (not used atm)
│
├── etc/                # currently, my folder for text/functions used by installer
│
├── tests/             # Dockerfile and scripts to test installation
│
├── README.md           # Documentation explaining your dotfiles, setup, etc.
│
└── .gitignore          # Gitignore to exclude unnecessary files from the repo
```
