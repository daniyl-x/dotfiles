#!/bin/sh


# Disable touchpad on startup
$HOME/.config/qtile/toggle_touchpad.sh


# Applications
xscreensaver &
nm-applet &
blueman-applet &

syncthing serve --no-browser --logfile=default &
keepassxc &

