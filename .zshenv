# Binaries
declare -U path PATH

path=($path /home/alex/.local/bin /home/linuxbrew/.linuxbrew/bin)

# Default programs
export EDITOR='nvim'
export BROWSER='qutebrowser'

export MANPAGER='nvim +Man!'
export MANSECT='1:1p:3:3p:3pm:0p:2:5:7:4:8:9:n:l:p:o:1x:2x:3x:4x:5x:6x:7x:8x'

# Output properties
case "${TERM}" in
    (st | kitty | xterm-kitty | xterm | urxvt | gnome-terminal | *-256color)

        export PCREGREP_COLOR='1;91'
        export GREP_COLORS='ms=01;04;93:fn=01;38;5;171:ln=97'
    ;;
esac

# GNU Indent
export VERSION_CONTROL='none'

whence -p mcfly &> /dev/null && {

    export MCFLY_PROMPT=''
    export MCFLY_RESULTS=40
    export MCFLY_KEY_SCHEME='vim'
    export MCFLY_RESULTS_SORT='LAST_RUN'
    export MCFLY_HISTORY_LIMIT=1000
    export MCFLY_INTERFACE_VIEW='BOTTOM'
}

export NOTES_DIRECTORY='/home/alex/.notes'

whence -p brew &> /dev/null && {

    export HOMEBREW_NO_EMOJI
    export HOMEBREW_AUTOREMOVE
    export HOMEBREW_CURL_VERBOSE
    export HOMEBREW_NO_ENV_HINTS
    export HOMEBREW_NO_ANALYTICS
    export HOMEBREW_AUTO_UPDATE_SECS=43200
    export HOMEBREW_NO_INSECURE_REDIRECT
    export HOMEBREW_CLEANUP_MAX_AGE_DAYS=20
}

export PYTHONSTARTUP="${HOME}/.pythonrc"

export QT_QPA_PLATFORMTHEME='qt5ct'
