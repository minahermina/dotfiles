setxkbmap -layout us,ara -variant ,digits -option grp:ctrl_space_toggle caps:escape
xmodmap $XDG_CONFIG_HOME/xmodmap/Xmodmap
dbus-update-activation-environment --all
sxhkd &
ofh &
xsetroot -solid "#161616"
xset r rate 200 30 &
greenclip daemon &
dwmblocks &
dwm
