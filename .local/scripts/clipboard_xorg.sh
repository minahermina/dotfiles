#!/bin/dash
set -e
clipmenu

focused_window_name=$(xdotool getwindowname $(xdotool getactivewindow))
 
case "$focused_window_name" in
    *"Zen"*) 
        xdotool key Ctrl+v
    ;;
    *"tmux"*) 
        xdotool key Ctrl+Shift+p
    ;;
    *) 
    ;;
esac
