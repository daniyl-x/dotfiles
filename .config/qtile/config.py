#        _   _ _      
#   __ _| |_(_) | ___ 
#  / _` | __| | |/ _ \
# | (_| | |_| | |  __/
#  \__, |\__|_|_|\___|
#     |_|             
 
# Copyright (c) 2010 Aldo Cortesi
# Copyright (c) 2010, 2014 dequis
# Copyright (c) 2012 Randall Ma
# Copyright (c) 2012-2014 Tycho Andersen
# Copyright (c) 2012 Craig Barnes
# Copyright (c) 2013 horsik
# Copyright (c) 2013 Tao Sauvage
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

import os
import subprocess

from libqtile import bar, hook, layout, qtile, widget
from libqtile.config import Click, Drag, EzKey, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal
from libqtile.widget import backlight

from colors import palenight as colors


# Mod key
mod = "mod4"

# Default programms
terminal = "kitty"
file_manager = "nemo"
browser = "librewolf"


keys = [
    ### CONTROL KEYS ###

    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),

    # Move windows
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),

    # Grow windows
    Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),

    Key([mod], "w", lazy.window.kill(), desc="Kill focused window"),
    Key([mod, "shift"], "f", lazy.window.toggle_floating(), desc="Toggle window floating"),

    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "r", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),


    ### SPECIAL KEYS ###
    
    # Keyboard layout
    Key(
        ["mod1"], "Shift_L",
        lazy.widget["keyboardlayout"].next_keyboard(),
        desc="Next keyboard layout"
    ),

    # Touchpad toggle
    Key([], "F6", lazy.spawn(os.path.expanduser("~/.config/qtile/toggle_touchpad.sh")), desc="Toggle touchpad"),

    # Screenshot
    Key(
        [], "Print",
        lazy.spawn("bash -c 'flameshot screen -p $HOME/Pictures'"),
        desc="Screenshot of full screen"
    ),
    Key(["control"], "Print", lazy.spawn("flameshot gui"), desc="Screenshot of area"),

    # Brightness
    Key(
        [], "XF86MonBrightnessDown", 
        lazy.widget["backlight"].change_backlight(backlight.ChangeDirection.DOWN),
        desc="Reduce brightness"
    ),
    Key(
        [], "XF86MonBrightnessUp", 
        lazy.widget["backlight"].change_backlight(backlight.ChangeDirection.UP),
        desc="Increase brightness"
    ),

    # Lock screen
    Key([], "F9", lazy.spawn("xscreensaver-command --lock"), desc="Lock screen"),

    # Volume
    Key([], "XF86AudioLowerVolume", lazy.widget["volume"].decrease_vol(), desc="Volume down"),
    Key([], "XF86AudioRaiseVolume", lazy.widget["volume"].increase_vol(), desc="Volume up"),
    Key([], "XF86AudioMute", lazy.widget["volume"].mute(), desc="Mute audio"),

    # Media keys
    Key([], "XF86AudioPlay", lazy.spawn("playerctl play-pause"), desc="Toggle play/pause"),
    Key([], "XF86AudioPrev", lazy.spawn("playerctl previous"), desc="Switch to previous track"),
    Key([], "XF86AudioNext", lazy.spawn("playerctl next"), desc="Switch to next track"),

    # Microphone
    Key([], "XF86AudioMicMute", lazy.spawn("amixer set Capture toggle"), desc="Toggle microphone"),


    ### ROFI ###

    Key(
        [mod, "shift"], "Return",
        lazy.spawn(f"rofi -show drun -show-icons"),
        desc="Run launcher"
    ),
    Key(
        [mod, "control"], "q",
        lazy.spawn("rofi -show power-menu -modi 'power-menu:rofi-power-menu --no-symbols --choices=lockscreen/logout/reboot/shutdown'"),
        desc="Run power menu"
    ),


    ### APPS ###

    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    Key([mod], "b", lazy.spawn(browser), desc="Launch browser"),
    Key([mod], "f", lazy.spawn(file_manager), desc="Launch file manager"),
    

    ### SCRIPTS ###
    Key(
        [], "XF86Launch4",
        lazy.spawn("bash -c '$HOME/Code/scripts/switch_powerprofile.sh'"),
        desc="Switch powerprofile"
    ),
]


### GROUPS ###

# Groups range and names
groups = [Group(i) for i in "1234567890"]

for i in groups:
    keys.extend(
        [
            # Switch to group
            Key(
                [mod], i.name,
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),

            # Switch to & move focused window to group
            Key(
                [mod, "shift"], i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc="Switch to & move focused window to group {}".format(i.name),
            ),
        ]
    )


### LAYOUTS ###

layout_defaults = {
    "border_width": 2,
    "margin": 6,
    "border_normal": colors[0],
    "border_focus": colors[4],
}

layouts = [
    layout.MonadTall(**layout_defaults, ratio=0.55),
    layout.Max(**layout_defaults),
    layout.Columns(**layout_defaults),
    layout.Stack(**layout_defaults),
]

# Mouse control for floating layouts.
mouse = [
    # Move
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    # Resize
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    # Bring to front
    Click([mod], "Button2", lazy.window.bring_to_front()),
]


### SCREEN ###

widget_defaults = {
    "font": "NotoMono NF",
    "fontsize": 16,
    "padding": 5,
    "foreground": colors[7],
    "background": colors[0],
}
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        # Top Bar
        top=bar.Bar(
            [
                widget.CurrentLayoutIcon(),
                widget.Prompt(),

                widget.GroupBox(
                    hide_unused=True,
                    highlight_method="line",
                    this_current_screen_border=colors[4],
                    this_screen_border=colors[4],
                    urgent_border=colors[1],
                    urgent_text=colors[1],
                ),
                widget.WindowName(
                    fontsize=widget_defaults["fontsize"]-2,
                ),

                widget.Spacer(),
                widget.Clock(
                    format=" %a, %d.%m.%y   %H:%M",
                ),
                widget.Spacer(),

                widget.KeyboardLayout(
                    fmt="  {}",
                    configured_keyboards=["us", "ru", "ua"],
                    display_map={"us": "EN", "ua": "UK"},
                ),
                widget.Clipboard(
                    foreground=colors[3],
                    fmt="󱉨: {}",
                    blacklist=["keepassxc"],
                    timeout=None,
                ),
                widget.CheckUpdates(
                    display_format="Upd: {updates}",
                    distro="Fedora",
                    mouse_callbacks={"Button1": lambda: qtile.cmd_spawn(terminal + " -- sudo dnf update")},
                ),

                widget.WidgetBox(
                    text_closed="󰞗 ",
                    text_open="󰞘 ",
                    widgets=[
                        widget.Systray(),
                    ]
                ),
                
                widget.NetGraph(interface="wlp7s0"),

                widget.Memory(
                    fmt=" {}",
                    format="{MemUsed:.0f}{mm}",
                    mouse_callbacks={"Button1": lambda: qtile.cmd_spawn(terminal + " -- htop")},
                ),
                widget.CPU(
                    fmt=" {}",
                    format="{load_percent}%"
                ),
                
                widget.Backlight(
                    fmt="󰃟 {}",
                    backlight_name="nvidia_0",
                    brigtness_file="actual_brightness",
                    change_command="brightnessctl set {:.0f}",
                    step=1,
                ),
                widget.Volume(
                    fmt=" {}",
                    emoji=False
                ),

                # Volume widget uses amixer by default, so I just changed channel and look
                widget.Volume(
                    channel="Capture",
                    foreground=colors[6],
                    emoji=True,
                    emoji_list=["", "", "", ""],
                ),

                widget.Battery(
                    charge_char="",
                    discharge_char="",
                    fmt="󱐋 {}",
                    format="{percent:2.0%} {char} {hour:d}h{min:02d}m",
                    low_foreground=colors[1],
                    low_percentage=0.2,
                    update_interval=10,
                ),
            ],
            24,
        ),

        wallpaper="~/Pictures/wallpapers/nature/mountains-w-water.jpg",
        wallpaper_mode="stretch",
    ),
]


### HOOKS ###

@hook.subscribe.startup_once
def autostart():
    """Execute autostart script on the first Qtile starup"""
    home = os.path.expanduser("~/.config/qtile/autostart.sh")
    subprocess.Popen([home])


dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ]
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
