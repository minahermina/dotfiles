#!/bin/dash
set -e
clipmenu -i

focused_window_name=$(xdotool getwindowname $(xdotool getactivewindow))
 
case "$focused_window_name" in
    *"Firefox"*) 
        xdotool key Ctrl+v
    ;;
    *"tmux"*) 
        xdotool key Ctrl+Shift+p
    ;;
    *) 
    ;;
esac
