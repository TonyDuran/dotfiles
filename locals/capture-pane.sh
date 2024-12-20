#!/bin/bash
PANE_ID=$1
tmux capture-pane -t %${PANE_ID} -epS - > ~/pane-history-${PANE_ID}
