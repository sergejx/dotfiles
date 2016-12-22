#
# Executes commands at the start of an interactive session.
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Aliases and functions

alias ge="outofterm gedit"
alias nau="outofterm nautilus ."
alias yds="yandex-disk status"
alias ydstart="yandex-disk start"

function outofterm () {
    $@ >/dev/null 2>&1 &!
}
