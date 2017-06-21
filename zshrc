#
# User configuration sourced by interactive shells
#

# Source zim
if [[ -s ${ZDOTDIR:-${HOME}}/.zim/init.zsh ]]; then
  source ${ZDOTDIR:-${HOME}}/.zim/init.zsh
fi

# Aliases and functions
function outofterm () {
    $@ >/dev/null 2>&1 &!
}

# GUI tools
alias ge='outofterm gedit'
alias nau='outofterm nautilus .'

# Git
alias gst='git status'

# Activate virtual environment in current directory
alias venv='source venv/bin/activate'
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
