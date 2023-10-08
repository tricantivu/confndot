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

readonly TMP="$(mktemp "/tmp/${0##*/}.XXXXXX")"

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
    xrandr > "${TMP}"

    while read -r l; do

        match "${l}" 'HDMI* connected*' && {

            xrandr --output "${l%%' '*}" --right-of eDP1 --primary
        }

        match "${l}" 'HDMI* disconnected*' && {

            xrandr --output eDP1 --primary
        }

    done < "${TMP}"

else
    die 'xrandr is not installed' 2> "${TMP}"

fi

# Log verbose output
readonly WM_LOG="$(mktemp '/tmp/i3.XXXXXX.log')"

exec i3 -V > "${WM_LOG}" || [ $? -eq 127 ] && {

    die "i3 window manager is not installed, edit '${0##*/}' or install it"

    rm -- "${WM_LOG}" 1> /dev/null 2>&1

    exit 1
}
