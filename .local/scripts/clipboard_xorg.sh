#!/bin/bash
set -e
clipmenu -i

focused_window_name=$(xdotool getwindowname $(xdotool getactivewindow))
 
case "${focused_window_name,,}" in
    *"$BROWSER"*) 
        xdotool key Ctrl+v
    ;;
    *"tmux"*) 
        xdotool key Ctrl+Shift+v
    ;;
    *) 
    ;;
esac
