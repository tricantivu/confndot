#!/usr/bin/env sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

die() {

    printf "error: ${0##*/}: %s\n" "$*" >&2
}

isinpath() {

    if command -vp -- "$1" 1> /dev/null 2>&1; then
        return 0

    else
        return 1

    fi
}

match() {

    case "$1" in
        ($2)

            return 0
        ;;
    esac

    return 1
}

umask 077

readonly TMP_CMD_OUTFILE="$(mktemp "/tmp/${0##*/}.XXXXXX")"

if isinpath xrdb; then
    xrdb -load "${HOME}/.Xresources"

else
    die 'xrdb is not installed' 2> "${TMP}"

fi

# Key repetition
if isinpath xset; then
    xset r rate 400 35

else
    die 'xset is not installed' 2> "${TMP}"

fi

# Keyboard layout
if isinpath setxkbmap; then
    setxkbmap -layout latam

else
    die 'setxkbmap is not installed' 2> "${TMP}"

fi

# Configure screen outputs
if isinpath xrandr; then
    # Read xrandr output line by line
    xrandr > "${TMP_CMD_OUTFILE}"

    while read -r l; do

        match "${l}" 'HDMI* connected*' && {

            xrandr --output "${l%%' '*}" --right-of eDP1 --primary
        }

        match "${l}" 'HDMI* disconnected*' && {

            xrandr --output eDP1 --primary
        }

    done < "${TMP_CMD_OUTFILE}"

else
    die 'xrandr is not installed' 2> "${TMP}"

fi

readonly WM_STDERR_LOG="$(mktemp '/tmp/wm.XXXXXX.log')"

exec i3 -V 2> "${WM_STDERR_LOG}" || exit
