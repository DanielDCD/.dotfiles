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

from typing import List  # noqa: F401
import os
import subprocess

from libqtile import bar, layout, widget, hook, qtile
from libqtile.config import Click, Drag, EzKey, Group, Key, Match, Screen
from libqtile.lazy import lazy

@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser("~/.config/qtile/autostart.sh")
    subprocess.run([home])

@lazy.function
def show_launcher(qtile):
    os.system("ulauncher &")

@lazy.function
def show_power_menu(qtile):
    qtile.cmd_spawn("arcolinux-logout")

# Dracula colors.
colors = {
    "foreground": "#f8f8f2",
    "background": "#282a36",
    "color0": "#21222c",
    "color1": "#ff5555",
    "color2": "#50fa7b",
    "color3": "#f1fa8c",
    "color4": "#bd93f9",
    "color5": "#ff79c6",
    "color6": "#8be9fd",
    "color7": "#f8f8f2"
}

mod = "mod4"

terminal = "kitty" 
browser = "vivaldi-stable"
browser_incognito = "vivaldi-stable --incognito"
file_manager = "dolphin"
lock_screen = "betterlockscreen --lock"

keys = [
    # Launchpad and task switcher
    Key(["mod1"], "space", show_launcher),

    # Lock screen
    Key([mod], "F12", lazy.spawn(lock_screen)),

    # Toggle fullscreen and maximum size
    Key([mod], "f", lazy.window.toggle_fullscreen()),
    Key([mod], "m", lazy.layout.maximize()),

    # Toggle floating
    Key([mod, "shift"], "f", lazy.window.toggle_floating()),

    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(),
        desc="Move window focus to other window"),

    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(),
        desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(),
        desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(),
        desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),

    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "l",
        lazy.layout.grow_right(),
        lazy.layout.grow(),
        lazy.layout.increase_ratio(),
        lazy.layout.delete(),
    ),
    Key([mod, "control"], "h",
        lazy.layout.grow_left(),
        lazy.layout.shrink(),
        lazy.layout.decrease_ratio(),
        lazy.layout.add(),
    ),
    Key([mod, "control"], "k",
        lazy.layout.grow_up(),
        lazy.layout.grow(),
        lazy.layout.decrease_nmaster(),
    ),
    Key([mod, "control"], "j",
        lazy.layout.grow_down(),
        lazy.layout.shrink(),
        lazy.layout.increase_nmaster(),
    ),

    # Flip layout for BSP.
    Key([mod, "mod5"], "k", lazy.layout.flip_up()),
    Key([mod, "mod5"], "j", lazy.layout.flip_down()),
    Key([mod, "mod5"], "l", lazy.layout.flip_right()),
    Key([mod, "mod5"], "h", lazy.layout.flip_left()),

    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key([mod], "n", lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack"),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),

    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Change to next layout"),
    Key([mod, "shift"], "Tab", lazy.prev_layout(), desc="Change to previous layout."),
    Key([mod], "w", lazy.window.kill(), desc="Kill focused window"),

    Key([mod, "control"], "r", lazy.restart(), desc="Restart Qtile"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "r", lazy.spawncmd(),
        desc="Spawn a command using a prompt widget"),

    # Stack controls
    Key([mod, "shift"], "space", lazy.layout.rotate(), lazy.layout.flip()),

    # Launch apps
    Key([mod], "e", lazy.spawn(file_manager)),
    Key([mod], "b", lazy.spawn(browser)),
    Key([mod, "shift"], "b", lazy.spawn(browser_incognito)),
]

groups = [Group(i) for i in "123456789"]

for i in groups:
    keys.extend([
        # mod1 + letter of group = switch to group
        Key([mod], i.name, lazy.group[i.name].toscreen(),
            desc="Switch to group {}".format(i.name)),

        # mod1 + shift + letter of group = switch to & move focused window to group
        Key([mod, "shift"], i.name, lazy.window.togroup(i.name, switch_group=True),
            desc="Switch to & move focused window to group {}".format(i.name)),
        # Or, use below if you prefer not to switch to that group.
        # # mod1 + shift + letter of group = move focused window to group
        # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
        #     desc="move focused window to group {}".format(i.name)),
    ])

layout_theme = {
    "border_width": 2,
    "margin": 5,
    "border_focus": colors["color4"],
    "border_normal": colors["background"]
}

layouts = [
    layout.MonadTall(**layout_theme, single_border_width=0, single_margin=0),
    layout.Columns(**layout_theme,margin_on_single=0),
    layout.Stack(**layout_theme, num_stacks=3),
    layout.Stack(**layout_theme, num_stacks=2),
    layout.MonadThreeCol(**layout_theme, single_border_width=0, single_margin=0, main_centered=False),
    layout.MonadThreeCol(**layout_theme, single_border_width=0, single_margin=0),
    layout.Max(),
    layout.Bsp(**layout_theme),
    layout.Matrix(**layout_theme),
    layout.MonadWide(**layout_theme, single_border_width=0, single_margin=0),
    layout.RatioTile(**layout_theme),
    layout.Floating(**layout_theme),
    layout.TreeTab(
        active_bg=colors["color4"],
        active_fg=colors["foreground"],
        bg_color=colors["background"],
        font='CaskaydiaCove NF',  
        inactive_bg=colors["background"], 
        inactive_fg=colors["foreground"],
        previous_on_rm=True,
        sections=[''],
        padding_left=0,
        padding_x=0,
        padding_y=5,
        pannel_width=200,
        urgent_bg=colors["color1"],
        urgent_fg=colors["foreground"],
    ),
]

widget_defaults = dict(
    font='CaskaydiaCove Nerd Font Mono',
    fontsize=14,
    padding=1,
)
extension_defaults = widget_defaults.copy()

def icon(background, foreground, text='?'):
    return widget.TextBox(
        text=text,
        background=background,
        foreground=foreground,
        fontsize=24,
        padding=3
    )

def powerline(foreground, background = None, text='\ue0b2', padding=-0.5):
    return widget.TextBox(
        text=text,
        background=background,
        foreground=foreground,
        fontsize=22,
        padding=padding,
    )

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.TextBox(
                    mouse_callbacks={'Button1': show_launcher},
                    text="\uf17c", # Linux icon.
                    padding=3,
                    background=colors["color4"],
                    foregroudn=colors["foreground"],
                    fontsize=24,
                ),
                powerline(colors["color4"], colors["color5"], text='\ue0b0', padding=-0.505),
                widget.GroupBox(
                    active=colors["foreground"],
                    inactive=colors["color0"],
                    highlight_color=colors["color4"],
                    highlight_method='line',
                    urgent_alert_method='box',
                    urgent_text=colors["color1"],
                    foreground=colors["foreground"],
                    hide_unused=True,
                    background=colors["color5"],
                ),
                powerline(colors["color5"], text='\ue0b0', padding=-0.505),
                widget.TaskList(
                    txt_floating='\uf2d2',
                    txt_maximized='\uf2d0',
                    txt_minimized='\uf2d1',
                    border=colors["color4"],
                    unfocused_border=colors["color7"],
                    urgent_border=colors["color1"],
                    padding_x=0,
                    padding_y=0,
                    margin=3,
                    icon_size=18,
                ),
                powerline(colors["color1"]),
                widget.CurrentLayoutIcon(
                    background=colors["color1"],
                    foreground=colors["color0"],
                    scale=0.75,
                ),
                widget.CurrentLayout(
                    background=colors["color1"],
                    foreground=colors["color0"],
                ),
                powerline(colors["color2"], colors["color1"]),
                icon(colors["color2"], colors["color0"], '\uf2db'), # Microchip icon.
                widget.CPU(
                    background=colors["color2"],
                    foreground=colors["color0"],
                    format='{load_percent}%',
                ),
                icon(colors["color2"], colors["color0"], ' \uf85a'), # Memory icon.
                widget.Memory(
                    background=colors["color2"],
                    foreground=colors["color0"],
                    format='{MemUsed: .2f}/{MemTotal: .2f}{mm}'.replace(' ', ''),
                    measure_mem='G',
                ),
                icon(colors["color2"], colors["color0"], ' \ufa9e'), # Web icon.
                widget.Net(
                    background=colors["color2"],
                    foreground=colors["color0"],
                    format='{down} \uf175\uf176 {up}'
                ),
                powerline(colors["color3"], colors["color2"]),
                icon(colors["color3"], colors["color0"], '\uf64f'), # Clock icon.
                widget.Clock(
                    background=colors["color3"],
                    foreground=colors["color0"],
                    format="%d/%m/%Y - %H:%M",
                ),
                powerline(colors["color4"], colors["color3"]),
                widget.Systray(
                    background=colors["color4"],
                    foreground=colors["foreground"],
                    icon_size=20,
                ),
                widget.Sep(
                    background=colors["color4"],
                    foreground=colors["foreground"],
                ),
                widget.TextBox(
                    background=colors["color4"],
                    foregroudn=colors["foreground"],
                    text="\u23fb", # Power Button.
                    padding=3,
                    fontsize=24,
                    mouse_callbacks={'Button1': show_power_menu},
                ),
            ],
            size=22,
            opacity=0.8,
            background=colors["background"]
        ),
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class='confirmreset'),  # gitk
        Match(wm_class='makebranch'),  # gitk
        Match(wm_class='maketag'),  # gitk
        Match(wm_class='ssh-askpass'),  # ssh-askpass
        Match(title='branchdialog'),  # gitk
        Match(title='pinentry'),  # GPG key password entry
    ],
    border_focus=colors["color4"],
    border_width=2
)

auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
