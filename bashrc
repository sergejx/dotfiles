# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# Additional paths
if [ -d ~/.local/bin ]; then
    export PATH=$HOME/.local/bin:$PATH
fi
if [ -d $HOME/.local/share/JetBrains/Toolbox/scripts ]; then
    export PATH="$PATH:$HOME/.local/share/JetBrains/Toolbox/scripts"
fi

# Prompt ############################################################
# Inspired by https://github.com/sapegin/dotfiles/blob/bash/includes/bash_prompt.bash

# Colors
RED="$(tput setaf 1)"
GREEN="$(tput setaf 2)"
YELLOW="$(tput setaf 3)"
BLUE="$(tput setaf 4)"
MAGENTA="$(tput setaf 5)"
CYAN="$(tput setaf 6)"
WHITE="$(tput setaf 7)"
GRAY="$(tput setaf 8)"
BOLD="$(tput bold)"
UNDERLINE="$(tput sgr 0 1)"
INVERT="$(tput sgr 1 0)"
NOCOLOR="$(tput sgr0)"

source $HOME/.git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWUPSTREAM="auto"

# User color
case $(id -u) in
	0) PS_user_color="$RED" ;;  # root
	*) PS_user_color="$GRAY" ;;
esac

# Local or SSH session?
PS_remote=
[ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ] && PS_remote=1

# Only show username if not default
PS_user=
[ "$USER" != "sergej" ] || [ -n "$PS_remote" ] && PS_user="\[$PS_user_color\]\u\[$NOCOLOR\]"

# Show hostname inside SSH session
PS_host=
[ -n "$PS_remote" ] && PS_host="\[$GRAY\]@\h\[$NOCOLOR\]"

# Show delimiter if user or host visible
PS_delimiter=
[ -n "$PS_user" ] || [ -n "$PS_host" ] && PS_delimiter=" "

PS_status="\$(if [[ \$? = 0 ]]; then echo \"\[$CYAN\]❯\"; else echo \"\[$RED\]❯\"; fi)"
PS_dir='\[$BLUE\]\w\[$GRAY\]$(__git_ps1 " %s")'
PS1="$PS_user$PS_host$PS_delimiter$PS_dir $PS_status\[$NOCOLOR\] "

# Bash options ######################################################

HISTSIZE=10000
HISTFILESIZE=10000
HISTCONTROL=ignoreboth
shopt -s globstar   # Recursive glob with **

# Aliases and functions #############################################

# Useful aliases
alias open='xdg-open'

# GUI tools
alias ge="outofterm gedit"
alias nau="outofterm nautilus ."

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

function history_top () {
    history | awk '{a[$2]++}END{for(i in a){print a[i] " " i}}' | sort -rn | head
}

# Helper functions
function outofterm () {
    command=$1
    shift
    $command $@ >/dev/null 2>&1 &
    disown
}

