#!/bin/sh
muted=$(pactl get-sink-mute @DEFAULT_SINK@ | awk '{print $2}')
[ "$muted" = "yes" ] && printf "MUTED" && exit
pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+%' | head -1
