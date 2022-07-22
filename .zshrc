# 	 _________  _   _
#	|__  / ___|| | | |
#  	  / /\___ \| |_| |
# 	 / /_ ___) |  _  |
#	/____|____/|_| |_|
#
# 	 Made with figlet


# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history HISTSIZE=10000 SAVEHIST=10000

setopt autocd extendedglob nomatch notify
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename "/home/alex/.zshrc"

autoload -Uz compinit
compinit

# End of lines added by compinstall

# Use a fallback prompt if shell is running on a TTY.
if [[ "${TERM}" = linux ]]; then

    PROMPT=$'\e[38;5;226m\(\e[0m\e[38;5;45m%n\e[0m\e[38;5;198m\@[0m\e[38;5;85m%m\e[0m %~\e[38;5;226m\)\e[0m '

    eval "$(mcfly init zsh)"
else
    eval "$(mcfly init zsh)"
    eval "$(starship init zsh)"
fi

# Environment variables

# Binaries
PATH="/home/alex/Documentos/bashy/src:/home/alex/Documentos/euryx/src:${PATH}"

# Editors
export EDITOR=nvim SUDO_EDITOR=nvim

# Locale
export LC_MESSAGES='en_US.UTF-8'

# Other stuff

# Credits: https://zameermanji.com/blog/2012/12/30/using-vim-as-manpager
export MANPAGER="/bin/sh -c \"col -b | vim -c 'set ft=man ts=8 nolist noma' -\""
export NOTES_DIRECTORY="/home/alex/.notes"

# Shell plugins
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Aliases
source ~/.aliases

# Configure SSH
s() {
    whence -p pkill ssh-{agent,add} &> /dev/null || return 1

    # Terminate existing ssh-agent processes.
    pkill ssh-agent &> /dev/null

    # Set necessary environment variables.
    eval $(ssh-agent) &> /dev/null

    ssh-add
}

# Show names of files matching an ERE with grep
# if more than one file was given to it.
#
# Usage: g [PATTERN] [FILE]

eg() {
    (( ${ARGC} < 2 )) && return 1

    local filesToSearch=("${@:2}")

    (( ${#filesToSearch} > 1 )) && grep --color=always -EH -- \
                                   "$1" "${filesToSearch[@]}"

    (( ${#filesToSearch} == 1 )) && grep --color=always -E -- \
                                    "$1" "${filesToSearch[@]}"
}

# Delete trailing tab and space characters from text
# files in the current directory and subdirectories
#
# Usage: dt

dt() {

    # Get a list of filenames with trailing tabs and/or spaces.
    filenameList=("$(grep -EIlr --color=never '[[:blank:]]+$' *)")

    # Fail when list is empty.
    (( ${#filenameList} == 0 )) && return 1

    # Delete trailing characters.
    sed -Ei 's/(\s|\t)+$//g' "${filenameList[@]}" &> /dev/null
}
