#!/bin/sh
nvidia-settings --assign CurrentMetaMode="nvidia-auto-select +0+0 { ForceFullCompositionPipeline = On }"
/usr/local/bin/set-xrandr-config
xrdb -merge ~/.Xresources

dbus-update-activation-environment --all

xfce4-panel &
fastcompmgr -c -C &
xbindkeys
xappkeys &
dunst -conf "$HOME/.config/dunst/dunstrc" &
feh --bg-fill --no-xinerama "$HOME/Documents/bg.jpg"

exec openbox

