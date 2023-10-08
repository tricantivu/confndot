#!/usr/bin/env sh

umask 077

for cmd in xset xrdb xrandr setxkbmap; do
    command -p "${cmd}" >&- 2>&- || exit
done

xrdb -load "${HOME}/.Xresources"

# Key repetition
xset r rate 400 35

# Keyboard layout
setxkbmap -layout latam

# Configure screen outputs
xrandr | grep -Eq 'HDMI disconnected' && xrandr --output eDP1 --primary

readonly WM_STDERR_LOG="$(mktemp '/tmp/wm.XXXXXX.log')"

exec i3 -V 2> "${WM_STDERR_LOG}" || exit
