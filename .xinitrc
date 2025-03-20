dbus-update-activation-environment --all &
setxkbmap -layout us,ara -variant ,digits -option grp:ctrl_space_toggle caps:escape
xmodmap $XDG_CONFIG_HOME/xmodmap/Xmodmap
sxhkd &
ofh &
xsetroot -solid "#131313"
xset r rate 200 30 &
greenclip daemon &
dwmblocks &
dwm
