# Shell options
shopt -s cdspell autocd checkjobs huponexit extglob failglob histappend

set -o vi

# Environment variables.
export HISTFILE=~/.bash_history HISTCONTROL='ignorespace' HISTTIMEFORMAT='%d/%m/%Y   %T   '

export UMASK=0033

# Reference: (https://www.linuxhowtos.org/Tips%20and%20Tricks/ansi_escape_sequences.htm)
export PS1="\033[38;5;220m[\[\033[1;36m\u\033[38;5;120m@\033[38;5;203m\h \033[0;97m\w\]\033[38;5;220m] >\033[0m "

# Third-party utilities.
eval "$(mcfly init bash)"

# Use aliases from a file.
source ~/.aliases

# Functions to make tedious/repetitive tasks more interactive and automatic.

extract() {
    [[ $# -ne 1 ]] && { printf '%s\n' "Usage: ${FUNCNAME[0]} <FILE>"; return 1; }

    local fileType="$(file -b -- "$1")"

    # Extract file(s).
    printf '%b\n' "Decompressing file \"$1\":\n"

    shopt -s nocasematch

    case "${fileType}" in
        (xz*)
            xz --decompress --verbose -- "$1"
        ;;
        (bzip2*)
            bzip2 --decompress --verbose -- "$1"
        ;;
        (zip*)
            unzip --verbose -- "$1"
        ;;
        (gzip*)
            gzip --uncompress --verbose -- "$1"
        ;;
        (*)
            return 1
        ;;
    esac

    shopt -u nocasematch
}
