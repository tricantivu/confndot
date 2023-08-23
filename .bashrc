opts=(histappend
      huponexit
      checkjobs
      dirspell
      failglob
      cdspell
      extglob
      autocd)

shopt -s "${opts[@]}" && set -o vi

type -P mcfly &> /dev/null && {

    eval "$(mcfly init bash)"

    export MCFLY_PROMPT=''
    export MCFLY_RESULTS=40
    export MCFLY_KEY_SCHEME='vim'
    export MCFLY_RESULTS_SORT='LAST_RUN'
    export MCFLY_HISTORY_LIMIT=1000
    export MCFLY_INTERFACE_VIEW='BOTTOM'
}

export HISTCONTROL='ignorespace'
export HISTTIMEFORMAT='%d/%m/%Y   %T   '

type -P starship &> /dev/null && {

    eval "$(starship init bash)"
}

[[ -r "${HOME}/.aliases" && -s "${HOME}/.aliases" ]] && source "${HOME}/.aliases"
