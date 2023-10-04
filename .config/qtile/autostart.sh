#!/bin/sh

# Applications
xscreensaver &
nm-applet &
blueman-applet &

syncthing serve --no-browser --logfile=default &
keepassxc &

