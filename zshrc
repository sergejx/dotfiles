
#
# User configuration sourced by interactive shells
#

# Define zim location
export ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim

# Start zim
[[ -s ${ZIM_HOME}/init.zsh ]] && source ${ZIM_HOME}/init.zsh

autoload -U zmv

# Aliases and functions
function outofterm () {
    $@ >/dev/null 2>&1 &!
}

# Neovim
if [ -f /usr/bin/nvim ]; then
    alias vi='nvim'
    alias vim='nvim'
fi

# GUI tools
alias ge='outofterm gedit'
alias nau='outofterm nautilus .'

# Docker
alias dkc='docker-compose'

# Local server for static pages
alias servethis='python3 -m http.server 8000'

# Yandex Disk
alias yds='yandex-disk status'
alias ydstart='yandex-disk start'
alias ydp='yandex-disk publish'

# DNF aliases (based on Prezto module)
alias dnfc='sudo dnf clean all'    # Cleans the cache.
alias dnfh='sudo dnf history'      # Displays history.
alias dnfi='sudo dnf install'      # Installs package(s).
alias dnfl='dnf list'              # Lists packages.
alias dnfL='dnf list installed'    # Lists installed packages.
alias dnfq='dnf info'              # Displays package information.
alias dnfr='sudo dnf remove'       # Removes package(s).
alias dnfs='dnf search'            # Searches for a package.
alias dnfu='sudo dnf upgrade'      # Upgrades packages.
