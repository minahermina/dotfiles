#!/bin/sh
    choice=$(printf "suspend\npoweroff\nreboot\nlogout" | dmenu -i -p "Choose action: ")

[ "$choice" = "exit"  ] && exit 
[ "$choice" = "poweroff" ] && doas poweroff
[ "$choice" = "reboot" ] && doas reboot
[ "$choice" = "suspend" ] && doas zzz
[ "$choice" = "logout" ] && pkill dwm
