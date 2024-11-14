setxkbmap -layout us,ara -variant ,digits -option grp:ctrl_space_toggle caps:escape
xmodmap $XDG_CONFIG_HOME/xmodmap/Xmodmap
dbus-update-activation-environment --all
sxhkd & 
picom &
ofh &
xwallpaper --zoom $HOME/Pictures/wallpaper2.jpg
greenclip daemon & 
dwmblocks & 
dwm
