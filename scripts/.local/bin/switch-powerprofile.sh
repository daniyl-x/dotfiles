#!/bin/sh

# SPDX-License-Identifier: BSD-2-Clause

# Copyright (c) 2023, daniyl-x


current_powerprofile=$(powerprofilesctl get)

if [ "$current_powerprofile" == "power-saver" ]; then
    powerprofilesctl set balanced && \
    notify-send "Balanced Mode Enabled" -e -i power-profile-balanced

elif [ "$current_powerprofile" == "balanced" ]; then
    powerprofilesctl set performance && \
    notify-send "Performance Mode Enabled" -e -i power-profile-performance
    
else
    powerprofilesctl set power-saver && \
    notify-send "Power-Saver Mode Enabled" -e -i power-profile-power-saver
    
fi

