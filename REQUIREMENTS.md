# Requirements
> **Note:**
> *thing*\* means the *thing* is not strictly required, but is used with
these dotfiles (icons, fonts, etc.).



## Table of contents
- [Alacritty](#alacritty)
- [Bash](#bash)
- [Dunst](#dunst)
- [GTK](#gtk)
- [Kitty](#kitty)
- [Micro](#micro)
- [Scripts](#scripts)
    - [autostart.sh](#autostartsh)
    - [switch-powerprofile.sh](#switch-powerprofilesh)
    - [tmux-fzf-picker.sh](#tmux-fzf-pickersh)
    - [toggle-touchpad.sh](#toggle-touchpadsh)
- [Qtile](#qtile)
- [Vim](#vim)



## Alacritty
- [IBM Plex](https://github.com/IBM/plex) &mdash; IBM Plex fonts


## Bash
- [bash-completion](https://github.com/scop/bash-completion)
&mdash; a collection of command line command completions for the Bash shell

- [sh dotfiles](sh/)
&mdash; my dotfiles package that I try to keep compatible with plain POSIX Shell
and reuse in other shells' dotfiles to simplify their management


## Dunst
- [Papirus Icons (dark)](https://github.com/PapirusDevelopmentTeam/papirus-icon-theme)
&mdash; free and open source SVG icon theme for Linux


## GTK
- [Papirus Icons (dark)](https://github.com/PapirusDevelopmentTeam/papirus-icon-theme)
&mdash; free and open source SVG icon theme for Linux


## Kitty
- [IBM Plex](https://github.com/IBM/plex) &mdash; IBM Plex fonts


## Micro
- filemanager\* &mdash; filemanager plugin

- fzf\* &mdash; fuzzy-finder plugin

- quoter\* &mdash; plugin to add quotes or brackets around a text selection


## Scripts
### autostart.sh
> **Note:**
> There is more programs in this script, but they're very user-specific
> (syncthing, password manager, etc.).

- [Blueman](https://github.com/blueman-project/blueman)
&mdash; GTK+ Bluetooth Manager

- [network-manager-applet](https://gitlab.gnome.org/GNOME/network-manager-applet)
&mdash; system tray applet for NetworkManager

- polkit-gnome
&mdash; GNOME integration with polkit

- [XScreenSaver](https://www.jwz.org/xscreensaver/)
&mdash; X screen saver program and collection of screen savers

### switch-powerprofile.sh
- [libnotify](https://gitlab.gnome.org/GNOME/libnotify)
&mdash; library for sending desktop notifications to a notification daemon,
as defined in the org.freedesktop.Notifications Desktop Specification

- [power-profiles-daemon](https://gitlab.freedesktop.org/upower/power-profiles-daemon)
&mdash; makes power profiles handling available over D-Bus

### tmux-fzf-picker.sh
- [fzf](https://github.com/junegunn/fzf)
&mdash; fuzzy-finder for convenient search and auto-completion of commands
from the terminal

- [tmux](https://github.com/tmux/tmux)
&mdash; terminal multiplexer

### toggle-touchpad.sh
- xinput
&mdash; utility to configure X input devices, such as mouses, keyboards, and
touchpads


## Qtile
> **Note:**
> You should change default app variables in the config.py file.

- [brightnessctl](https://github.com/Hummer12007/brightnessctl)
&mdash; CLI tool for controlling brightness

- [Flameshot](https://flameshot.org)
&mdash; screenshot tool that allows in-app editing

- [NetworkManager](https://networkmanager.dev/)
&mdash; standart network configuration tool suite

- [NetworkManager-wifi](https://networkmanager.dev/)
&mdash; NetworkManager module for WiFi support

- [Noto Nerd Font](https://nerdfonts.com)
&mdash; patched Noto fonts with multiple icons

- [playerctl](https://github.com/altdesktop/playerctl)
&mdash; CLI tool for controlling media players that implement the MPRIS D-Bus
Interface Specification

- [Rofi](https://github.com/DaveDavenport/rofi)
&mdash; application launcher and dmenu replacement

- [Rofi Power Menu](https://github.com/jluttine/rofi-power-menu)
&mdash; Rofi extension for basic power menu operations such as shutting down,
logging out, rebooting and suspending

- [Scripts\*](scripts)
&mdash; My custom scripts that can be used standalone, or in a window manager.
Their individual dependencies can be found in [Scripts](#scripts) block


## Vim
- [vim-plug](https://github.com/junegunn/vim-plug)
&mdash; a minimalist Vim plugin manager


