#!/bin/sh

feh --bg-scale ~/.dotfiles/wallpapers/GralicDogSpace2.jpg

# Compositor.
picom --experimental-backends --config "${HOME}/.config/qtile/picom.conf" &

# Systray icons.
nm-applet &
volumeicon &
