#!/bin/sh
op=$1
[ "$op" = "=" ] && pactl set-sink-mute @DEFAULT_SINK@ toggle
[ "$op" = "+" ] && {
    vol=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+%' | head -1 | tr -d '%')
    [ "$vol" -lt 125 ] && pactl set-sink-volume @DEFAULT_SINK@ +5%
}
[ "$op" = "-" ] && pactl set-sink-volume @DEFAULT_SINK@ -5%
pkill -RTMIN+20 dwmblocks
