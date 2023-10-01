#!/bin/sh

# Applications
xscreensaver &
blueman-applet &
syncthing serve --no-browser --logfile=default &
keepassxc &

