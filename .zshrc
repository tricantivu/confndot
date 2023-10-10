# 	 _________  _   _
#	|__  / ___|| | | |
#  	  / /\___ \| |_| |
# 	 / /_ ___) |  _  |
#	/____|____/|_| |_|
#
# 	 Made with figlet

#####################
# File modification #
#####################
unsetopt CLOBBER
setopt CLOBBER_EMPTY

###################
# Command history #
###################
setopt HIST_IGNORE_DUPS
setopt SHARE_HISTORY

HISTSIZE=10000
SAVEHIST=10000

HISTFILE=~/.zsh_history

####################
# Pattern matching #
####################
setopt NUMERIC_GLOB_SORT
setopt REMATCH_PCRE
setopt NOMATCH

#########################
# Filesystem navigation #
#########################
setopt CD_SILENT
setopt AUTO_CD

#########################
# Arithmetic evaluation #
#########################
setopt C_PRECEDENCES
setopt OCTAL_ZEROES
setopt C_BASES

###############
# Job control #
###############
setopt CHECK_JOBS
setopt CHECK_RUNNING_JOBS
setopt NOTIFY

bindkey -v

# By compinstall
zstyle :compinstall filename '/home/alex/.zshrc'

autoload -Uz compinit
compinit

# 1 GiB / 512
ulimit -c 2097152

# Use a fallback prompt if shell is running on a TTY
if [[ "$(print -P '%l')" =~ ^[0-9]$ ]]; then
    PROMPT='$ '

else
    eval "$(mcfly init zsh)"
    eval "$(starship init zsh)"

fi

# Shell plugins
for plugin in /usr/share/zsh-{syntax-highlighting,autosuggestions}/*.zsh; do
    source "${plugin}"
done

# Aliases
alias history="history -t '| %d/%m/%Y  %T  (%Z, %z) |'"

source ~/.aliases

# Configure SSH
s() {

    whence -p pkill ssh-{agent,add} 1> /dev/null || return 1

    pkill ssh-agent 1> /dev/null

    eval $(ssh-agent) 1> /dev/null

    ssh-add
}
