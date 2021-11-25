#!/bin/sh

xbindkeys
emacs --daemon &
volumeicon &
nm-applet &
picom --no-vsync &
nitrogen --restore &
