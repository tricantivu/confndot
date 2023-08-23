: "${HISTFILE:=$HOME/.zsh_history}"

[[ -w "${HISTFILE}" && -s "${HISTFILE}" ]] && truncate -s 0 "${HISTFILE}"
