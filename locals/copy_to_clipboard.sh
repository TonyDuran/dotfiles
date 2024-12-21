#!/bin/zsh
tmux show-buffer > /tmp/tmux_clipboard.txt
cat /tmp/tmux_clipboard.txt | xclip -selection clipboard

