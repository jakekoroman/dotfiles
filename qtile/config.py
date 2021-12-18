# My Qtile Config
#  Jake Koroman


from typing import List  # noqa: F401

from libqtile import bar, layout, widget, hook
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal


# My Imports

import os
import subprocess

##############

# My Globals

default_padding = 10

colours = {
    'fg': '#bbc2cf',
    'bg': '#1e282d',
    'violet': '#a9a1e1',
    'purple': '#6272a4',
}

layout_theme = {
    'margin': 10,
    'border_focus': colours['violet'],
    'border_normal': colours['bg'],
}

##############

# My Functions


def get_main_bar():
    return bar.Bar(
        [
            widget.CurrentLayout(
                padding=default_padding,
                foreground=colours['fg']
            ),
            widget.GroupBox(
                active=colours['fg'],
                disable_drag=True,
                this_current_screen_border=colours['violet'],
                this_screen_border=colours['violet'], borderwidth=2
            ),
            widget.WindowName(
                foreground=colours['fg'],
                padding=default_padding*3
            ),
            # widget.TaskList(),
            widget.Chord(
                chords_colors={
                    'launch': ('#ff0000', '#ffffff'),
                },
                name_transform=lambda name: name.upper(),
            ),
            widget.Memory(
                foreground=colours['fg'],
                format='{MemUsed: .0f} MB  / {MemTotal: .0f} MB',
                padding=default_padding,
            ),
            widget.Net(
                interface='wlp40s0',
                format='{down} ↓↑ {up}',
                padding=default_padding,
                foreground=colours['bg'],
                background=colours['violet']
            ),
            widget.Clock(
                format='%a  %B %d  %H:%M',
                padding=default_padding,
                foreground=colours['fg'],
            ),
            widget.Systray(
                padding=default_padding,
            ),
            widget.Spacer(
                length=default_padding,
            ),
            # widget.QuickExit(),
        ],
        24,
        background='#282c34',
        opacity=0.95
    )


def get_second_bar():
    return bar.Bar(
        [
            widget.CurrentLayout(
                padding=default_padding,
                foreground=colours['fg']
            ),
            widget.GroupBox(
                active=colours['fg'],
                disable_drag=True,
                this_current_screen_border=colours['violet'],
                this_screen_border=colours['violet'], borderwidth=2
            ),
            widget.WindowName(
                foreground=colours['fg'],
                padding=default_padding*3
            ),
            widget.Clock(
                format='%a  %B %d  %H:%M',
                padding=default_padding,
                foreground=colours['fg'],
            ),
        ],
        24,
        background='#282c34',
        opacity=0.95
    )


def get_layouts():
    return [
        layout.MonadTall(**layout_theme),
        layout.Max(**layout_theme),
    ]


@hook.subscribe.startup_once
def autostart():
    autostart = os.path.expanduser('~/.config/qtile/autostart.sh')
    subprocess.call([autostart])


##############


mod = "mod4"
terminal = guess_terminal()

keys = [
    # Window focus movement
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.window.toggle_floating()),
    Key([mod], "f", lazy.window.toggle_fullscreen()),

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
    Key([mod, "control"], "h", lazy.layout.grow_left(),
        desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(),
        desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(),
        desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),

    # Launchers
    Key([mod], "Return", lazy.spawn('urxvt'), desc="Launch terminal"),
    Key([mod], 'r', lazy.spawn('rofi -icon-theme "Papirus" -show-icons -show drun'),
        desc="Launch rofi"),
    Key([mod], 'v', lazy.spawn('pcmanfm'), desc='Launch Pcmanfm'),
    Key([mod], 'b', lazy.spawn('firefox'), desc='Launch firefox'),
    #Key([mod], 'e', lazy.spawn('emacsclient -c -a emacs'), desc='Launch emacs'),
    Key([mod], 'e', lazy.spawn('emacs'), desc='Launch emacs'),

    # Super scary scrot cmd :)
    Key([mod, 'shift'], 's', lazy.spawn('scrot -s -e \'xclip -selection clipboard -t image/png -i $f; rm $f\''), desc='Screenshot tool'),

    # Toggle between different layouts as defined below
    Key([mod], 'Tab', lazy.next_layout(), desc='Toggle between layouts'),
    Key([mod, 'shift'], 'c', lazy.window.kill(), desc='Kill focused window'),

    # Monadtall Windows Binds
    Key([mod], "g", lazy.layout.grow()),
    Key([mod], "s", lazy.layout.shrink()),
    Key([mod], "m", lazy.layout.maximize()),
    Key([mod], "n", lazy.layout.normalize()),
    Key([mod, "shift"], "n", lazy.layout.reset()),
    Key([mod, "shift"], "space", lazy.layout.flip()),

    # Qtile options
    Key([mod, "control"], "r", lazy.restart(), desc="Restart Qtile"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
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

layouts = get_layouts()

widget_defaults = dict(
    font='Ubuntu',
    fontsize=12,
    padding=3,
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        top=get_main_bar(),
    ),
    Screen(
        top=get_second_bar(),
    )
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
floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    *layout.Floating.default_float_rules,
    Match(wm_class='confirmreset'),  # gitk
    Match(wm_class='makebranch'),  # gitk
    Match(wm_class='maketag'),  # gitk
    Match(wm_class='ssh-askpass'),  # ssh-askpass
    Match(title='branchdialog'),  # gitk
    Match(title='pinentry'),  # GPG key password entry
    Match(title='Friends List'),  # Steam friends list
    Match(title='Android Emulator - Pixel_4_API_30:5554'),  # Android Studio Emulator
])
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
