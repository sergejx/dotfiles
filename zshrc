# -----------------
# Zsh configuration
# -----------------

zstyle ':zim:zmodule' use 'degit'

# Define Zim location
ZIM_HOME=~/.zim

# Install missing modules, and update ${ZIM_HOME}/init.zsh if missing or outdated.
if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZDOTDIR:-${HOME}}/.zimrc ]]; then
  source ${ZIM_HOME}/zimfw.zsh init -q
fi

# Initialize modules.
source ${ZIM_HOME}/init.zsh

# --------------------
# Module configuration
# --------------------

# Prompt
zstyle ':prompt:pure:prompt:success' color cyan
zstyle ':prompt:pure:git:dirty' color 175


# Input
zstyle ':zim:input' double-dot-expand yes

# zsh-syntax-highlighting
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters.md
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

autoload -U zmv

# Aliases and functions
function outofterm () {
    $@ >/dev/null 2>&1 &!
}

# Useful aliases
alias open='xdg-open'

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
