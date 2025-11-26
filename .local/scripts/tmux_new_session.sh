#!/bin/sh

export TERM=screen
dir="$(find $REPOS  $HOME/codes/ -mindepth 1 -maxdepth 1 -type d ! -path "*/.git" \
        | sed "s|^$HOME/||" \
        | fzf
    )"
session_name=$(basename "$dir")

[ -z "$dir" ] && exit 1

session_exist=$(tmux ls  | awk '{print $1}' | grep -w "$session_name")
if [ "$session_exist" = "" ]; then
    tmux new-session -d -s "$session_name" -c "$dir" && tmux switch-client -t "$session_name"
else
    tmux switch-client -t "$session_name"
fi
