#        _   _ _
#   __ _| |_(_) | ___
#  / _` | __| | |/ _ \
# | (_| | |_| | |  __/
#  \__, |\__|_|_|\___|
#     |_|

# SPDX-License-Identifier: MIT

# Copyright (c) 2010 Aldo Cortesi
# Copyright (c) 2010, 2014 dequis
# Copyright (c) 2012 Randall Ma
# Copyright (c) 2012-2014 Tycho Andersen
# Copyright (c) 2012 Craig Barnes
# Copyright (c) 2013 horsik
# Copyright (c) 2013 Tao Sauvage
# Copyright (c) 2023-2025, daniyl-x

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
import json
from datetime import datetime, UTC

from libqtile import bar, hook, layout, qtile, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.widget import backlight

import keycodes as kc
from colors import doom_one as colors


# DEFAULTS & VARIABLES #

# Mod key
mod = "mod4"

# Default programs
terminal = "alacritty"
file_manager = "pcmanfm"
browser = "librewolf"


# FUNCTIONS #

def get_dnd_status():
    current_icon = qtile.widgets_map["donotdisturb"].poll()
    if current_icon == qtile.widgets_map["donotdisturb"].enabled_icon:
        return True
    return False


def toggle_dnd():
    qtile.widgets_map["donotdisturb"].button_press(x=0, y=0, button=1)


def should_impact_dnd(window):
    try:
        if "chrom" in window.get_wm_class()[0] and window.name[:5] != "Chrom":
            return True
    except BaseException:
        pass
    return False


# HOOKS #

@hook.subscribe.startup_once
def autostart():
    """Run autostart script on the first Qtile startup"""
    qtile.cmd_spawn("autostart.sh")


@hook.subscribe.client_managed
def enable_dnd(window):
    """Enable DoNotDisturb when specific programs are started"""
    if should_impact_dnd(window) and get_dnd_status() is False:
        toggle_dnd()


@hook.subscribe.client_killed
def disable_dnd(window):
    """Disable DoNotDisturb when specific programs are closed"""
    if should_impact_dnd(window) and get_dnd_status() is True:
        if not any(should_impact_dnd(w) for w in qtile.windows_map.values()):
            toggle_dnd()


@hook.subscribe.setgroup
def pip_follow():
    """Move Picture-in-Picture window to the current group,
    keep it on top, and return focus to the last window"""
    for window in qtile.windows_map.values():
        if window.name == "Picture-in-Picture":
            group = qtile.current_group
            window.togroup(group.name)
            window.keep_above([True])
            group.focus_back()


@hook.subscribe.focus_change
def focus_log():
    """Log focus changes into file"""
    last_window = qtile.current_group.last_focused
    data = {
            "time": datetime.now(UTC).isoformat(),
            "window_name": last_window.name,
            "wm_class": last_window.get_wm_class(),
            }

    log_path = f"/tmp/qtile-focus-log-{os.getuid()}.json"
    log_fd = os.open(
            log_path,
            os.O_CREAT | os.O_WRONLY | os.O_APPEND,
            mode=0o600
            )
    with os.fdopen(log_fd, "a") as log_file:
        json.dump(data, log_file)
        log_file.write("\n")

    log_size = os.path.getsize(log_path)
    if log_size >= (1024**2):
        os.remove(log_path)


# KEYS #

keys = [
        # Control & misc
        Key([mod, "control"], kc.r, lazy.reload_config(), desc="Reload the config"),
        Key([mod], kc.r, lazy.spawncmd(), desc="Spawn a command using prompt"),
        Key([mod], kc.w, lazy.window.kill(), desc="Kill focused window"),
        Key([mod, "control"], kc.f, lazy.window.toggle_floating(), desc="Toggle window floating"),
        Key([mod, "mod1"], kc.f, lazy.window.toggle_fullscreen(), desc="Toggle fullscreen"),

        # Switch focus
        Key([mod], kc.h, lazy.layout.left(), desc="Move focus left"),
        Key([mod], kc.j, lazy.layout.down(), desc="Move focus down"),
        Key([mod], kc.k, lazy.layout.up(), desc="Move focus up"),
        Key([mod], kc.l, lazy.layout.right(), desc="Move focus right"),
        Key([mod], "space", lazy.layout.next(), desc="Focus on the next window"),

        # Move windows
        Key([mod, "shift"], kc.h, lazy.layout.shuffle_left(), desc="Move window left"),
        Key([mod, "shift"], kc.j, lazy.layout.shuffle_down(), desc="Move window down"),
        Key([mod, "shift"], kc.k, lazy.layout.shuffle_up(), desc="Move window up"),
        Key([mod, "shift"], kc.l, lazy.layout.shuffle_right(), desc="Move window right"),

        # Grow windows
        Key([mod, "control"], kc.h, lazy.layout.grow_left(), desc="Grow window left"),
        Key([mod, "control"], kc.j, lazy.layout.grow_down(), desc="Grow window down"),
        Key([mod, "control"], kc.k, lazy.layout.grow_up(), desc="Grow window up"),
        Key([mod, "control"], kc.l, lazy.layout.grow_right(), desc="Grow window right"),
        Key([mod], kc.n, lazy.layout.normalize(), lazy.layout.reset(), desc="Reset window sizes"),

        # Change layout ratios
        Key([mod], kc.i, lazy.layout.grow(), desc="Grow layout ratio"),
        Key([mod], kc.m, lazy.layout.shrink(), desc="Shrink layout ratio"),
        Key([mod, "shift"], "space", lazy.layout.flip(), desc="Flip layout ratios"),

        # Switch layouts
        Key([mod], "Tab", lazy.next_layout(), desc="Switch next layout"),
        Key([mod, "shift"], "Tab", lazy.prev_layout(), desc="Switch layout back"),

        # Keyboard layout
        Key(
            ["mod1"], "Shift_L",
            lazy.widget["keyboardlayout"].next_keyboard(),
            desc="Switch keyboard layout"
            ),

        # Touchpad toggle
        Key([], "F6", lazy.spawn("toggle-touchpad.sh"), desc="Toggle touchpad"),

        # Screenshot
        Key(
            [], "Print",
            lazy.spawn("flameshot screen -p $HOME/Pictures", shell=True),
            desc="Screenshot of full screen"
            ),
    Key(["control"], "Print",lazy.spawn("flameshot gui"), desc="Screenshot of area"),

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
    Key(
            [], "F9",
            # Set keyboard layout to EN before locking the screen to prevent lockout
            lazy.spawn("setxkbmap -layout us && xscreensaver-command --lock", shell=True),
            desc="Lock screen"
            ),

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
    # for my mechanical keyboard without XF86AudioMicMute
    Key([], "XF86Tools", lazy.spawn("amixer set Capture toggle"), desc="Toggle microphone"),

    # Rofi
    Key(
            [mod, "shift"], "Return",
            lazy.spawn("rofi -show drun -show-icons"),
            desc="Run launcher"
            ),
    Key(
            [mod, "control"], kc.q,
            lazy.spawn(
                "rofi -show power-menu"
                " -modi 'power-menu:rofi-power-menu"
                " --choices=lockscreen/logout/reboot/shutdown'"
                ),
            desc="Run power menu"
            ),


    # Software
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    Key([mod], kc.b, lazy.spawn(browser), desc="Launch browser"),
    Key([mod], kc.f, lazy.spawn(file_manager), desc="Launch file manager"),


    # Scripts
    Key(
            [mod], kc.t,
            lazy.spawn(f"{terminal} -e tmux-fzf-picker.sh"),
            desc="Run tmux fzf picker script"
            ),
    # Key(
    #     [], "XF86Launch4",
    #     lazy.spawn("switch-powerprofile.sh"),
    #     desc="Switch powerprofile"
    #     ),
]


# SCREENS #

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
            top=bar.Bar(
                [
                    widget.CurrentLayoutIcon(
                        scale=0.85,
                        mouse_callbacks={
                            "Button2": None,
                            "Button3": qtile.prev_layout,
                            },
                        ),
                    widget.Prompt(
                        foreground=colors[1],
                        ),

                    widget.GroupBox(
                        active=widget_defaults["foreground"],
                        disable_drag=True,
                        hide_unused=True,
                        highlight_color=widget_defaults["background"],
                        highlight_method="line",
                        inactive=colors[8],
                        this_current_screen_border=colors[4],
                        this_screen_border=colors[4],
                        urgent_border=colors[1],
                        urgent_text=colors[1],
                        ),
                    widget.WindowName(
                        fontsize=widget_defaults["fontsize"]-2,
                        scroll=True,
                        width=300,
                        ),

                    widget.Spacer(),
                    widget.Clock(
                        # format=" %a, %d.%m.%y   %H:%M",
                        format="%a %d.%m.%y %H:%M",
                        ),
                    widget.Spacer(),

                    widget.KeyboardLayout(
                        fmt="󰥻 {}",
                        configured_keyboards=["us", "ru", "ua"],
                        display_map={"us": "EN", "ua": "UK"},
                        ),
                    widget.Clipboard(
                        foreground=colors[3],
                        fmt="󱉨 {}",
                        blacklist=["keepassxc"],
                        timeout=None,
                        ),

                    widget.WidgetBox(
                        text_closed="",
                        text_open="",
                        widgets=[
                            widget.Systray(padding=4),
                            ]
                        ),

                    # widget.NetGraph(
                    #     border_width=1,
                    #     border_color=colors[8],
                    #     fill_color=colors[4],
                    #     graph_color=colors[4],
                    #     line_width=2,
                    #     margin_x=1,
                    #     samples=75,
                    #     type="line",
                    #     ),

                    # widget.Memory(
                    #     fmt=" {}",
                    #     format="{MemUsed:.0f}{mm}",
                    #     mouse_callbacks={
                    #         "Button1": lazy.spawn(f"{terminal} -e htop"),
                    #         },
                    #     ),
                    # widget.CPU(
                    #     fmt=" {}",
                    #     format="{load_percent}%"
                    #     ),

                    widget.Backlight(
                        fmt="󰃟 {}",
                        backlight_name="nvidia_0",
                        brigtness_file="actual_brightness",
                        change_command="brightnessctl set {:.0f}",
                        step=1,
                        ),
                    widget.Volume(
                        fmt=" {}",
                        emoji=False,
                        foreground=colors[7],
                        mouse_callbacks={
                            "Button1": lazy.widget["volume"].mute(),
                            }
                        ),

                    # Using amixer to control micro via capture channel
                    widget.Volume(
                        fmt=" {}",
                        channel="Capture",
                        foreground=colors[6],
                        emoji=False,
                        emoji_list=["", "󱦳", "", "󱦲"],
                        mouse_callbacks={
                            "Button1": lazy.spawn("amixer set Capture toggle"),
                            }
                        ),

                    widget.DoNotDisturb(
                        foreground=colors[2],
                        enabled_icon="󰂛",
                        disabled_icon="󰂚",
                        ),

                    widget.Battery(
                        charge_char=" ",
                        discharge_char=" ",
                        fmt="󱐋 {}",
                        format="{percent:2.0%} {char}{hour:d}h{min:02d}m",
                        low_foreground=colors[1],
                        low_percentage=0.2,
                        update_interval=6,
                        ),

                    widget.CheckUpdates(
                        colour_have_updates=colors[10],
                        display_format="Up:{updates}",
                        distro="Fedora",
                        mouse_callbacks={
                            "Button1": lazy.spawn(f"{terminal} -e sudo dnf update"),
                            },
                        ),
                    widget.Wallpaper(
                        label="",
                        wallpaper_command=None,
                        random_selection=True,
                        directory="~/Pictures/wallpapers/fav/",
                        option="stretch",
                        ),
                ],
                24,
            ),
        ),
]


# LAYOUTS #

layout_defaults = {
        "border_width": 3,
        "margin": 5,
        "border_normal": colors[0],
        "border_focus": colors[4],
        }

# Custom margin for "Columns" layout
columns_defaults = layout_defaults.copy()
columns_defaults["margin"] = [3, 2, 3, 2]

layouts = [
        layout.MonadTall(
            **layout_defaults,
            ratio=0.46,
            single_border_width=0,
            ),
        layout.Columns(**columns_defaults),
        layout.Floating(**layout_defaults),
        ]

floating_layout = layout.Floating(
        **layout_defaults,
        float_rules=[
            *layout.Floating.default_float_rules,
            Match(wm_class="confirmreset"),  # gitk
            Match(wm_class="makebranch"),  # gitk
            Match(wm_class="maketag"),  # gitk
            Match(wm_class="ssh-askpass"),  # ssh-askpass
            Match(title="branchdialog"),  # gitk
            Match(title="pinentry"),  # GPG key password entry
            ]
        )

# Mouse control for floating layouts.
mouse = [
        # Move
        Drag(
            [mod], "Button1",
            lazy.window.set_position_floating(), start=lazy.window.get_position()
            ),
        # Resize
        Drag(
            [mod], "Button3",
            lazy.window.set_size_floating(), start=lazy.window.get_size()
            ),
        # Bring to front
        Click([mod], "Button2", lazy.window.bring_to_front()),
        ]


# GROUPS #

groups = [Group(i) for i in "1234567890"]

for group in groups:
    keys.extend(
            [
                Key(
                    [mod], group.name,
                    lazy.group[group.name].toscreen(),
                    desc=f"Switch to group {group.name}",
                    ),

                # Move focused window to group
                Key(
                    [mod, "shift"], group.name,
                    # switch_group=True to switch
                    lazy.window.togroup(group.name),
                    desc=f"Move focused window to group {group.name}",
                    ),
                ]
            )


# MISC #

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
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
