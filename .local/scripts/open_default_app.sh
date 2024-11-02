#!/bin/sh
set -xe
absolutepath=$(realpath "$1")
nvim_new_window="/home/mina/.local/scripts/tmux_new_window.sh"
mimetype=$(file --mime-type "$absolutepath" | awk '{print $2}')

case "$mimetype" in
    *"text/"*) 
        $nvim_new_window "nvim $absolutepath"
    ;;
    *) 
        notify-send "Not supported yet!"
    ;;
esac



