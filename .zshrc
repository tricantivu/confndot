# 	 _________  _   _
#	|__  / ___|| | | |
#  	  / /\___ \| |_| |
# 	 / /_ ___) |  _  |
#	/____|____/|_| |_|
#
# 	 Made with figlet

setopt c_precedences

# File modification
unsetopt clobber
setopt clobber_empty

# Command history
setopt hist_ignore_dups
setopt share_history

HISTSIZE=10000
SAVEHIST=10000

HISTFILE=~/.zsh_history

# Pattern matching
setopt numeric_glob_sort
setopt rematch_pcre
setopt nomatch

# Navigating directories
setopt cd_silent
setopt auto_cd

# Arithmetic
setopt octal_zeroes
setopt c_bases

# Job control
setopt check_jobs
setopt check_running_jobs
setopt notify

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
if [[ -r /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
    source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

elif [[ -r /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
    source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

fi

if [[ -r /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
    source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

elif [[ -r /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
    source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh

fi

# Aliases
alias history="history -t '| %d/%m/%Y  %T  (%Z, %z) |'"

[[ -f ~/.aliases && -s ~/.aliases ]] && source ~/.aliases

# Configure SSH
s() {

    whence -p pkill ssh-{agent,add} 1> /dev/null || return 1

    pkill ssh-agent 1> /dev/null

    eval $(ssh-agent) 1> /dev/null

    ssh-add
}

bindkey -s '^u' 'mpv --play-dir=forward --loop-playlist=inf ~/Music\n'
