#!/bin/sh

if pgrep -x "flameshot" > /dev/null; then
    pkill -x flameshot
else
    flameshot gui &
fi

