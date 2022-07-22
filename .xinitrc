#!/bin/bash
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

# Make the repetition of keys faster.
xset r rate 400 44

# Sets the latinamerican keyboard layout.
setxkbmap -layout latam

xrandr --output HDMI1 --right-of eDP1

exec i3 --shmlog-size 0
