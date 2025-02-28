#!/bin/sh
dir=$(find $REPOS  -mindepth 1 -maxdepth 1 -type d ! -path "*.git/"| tr ' ' '\n' | fzf)
session_name=$(basename "$dir")
if [ -z "$dir" ]; then 
    exit 1
else
    tmux new-session -d -s "$session_name" -c "$dir" && tmux switch-client -t "$session_name" 
fi






