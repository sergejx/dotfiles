# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
  PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

########## Aliases ########

# File system
alias ls='eza --group-directories-first --icons'
alias ll='eza -lh --group-directories-first --icons'
alias lsa='ls -a'
alias lt='eza --tree --level=2 --long --icons --git'
alias lta='lt -a'
alias ff="fzf --preview 'batcat --style=numbers --color=always {}'"

# Directories
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Tools
alias n='nvim'
alias g='git'
alias d='docker'
alias lzg='lazygit'


# DNF aliases (based on Prezto module)
alias dnfc='sudo dnf clean all' # Cleans the cache.
alias dnfh='sudo dnf history'   # Displays history.
alias dnfi='sudo dnf install'   # Installs package(s).
alias dnfl='dnf list'           # Lists packages.
alias dnfL='dnf list installed' # Lists installed packages.
alias dnfq='dnf info'           # Displays package information.
alias dnfr='sudo dnf remove'    # Removes package(s).
alias dnfs='dnf search'         # Searches for a package.
alias dnfu='sudo dnf upgrade'   # Upgrades packages.

# Local server for static pages
alias servethis='python3 -m http.server 8000'

## KPI VPN
alias kpivpn='sudo openvpn /home/sergej/.config/openvpn/kpi.ovpn'

########## Prompt ##########
# Technicolor dreams
force_color_prompt=yes
color_prompt=yes

# Simple prompt with path in the window/pane title and carat for typing line
PS1=$'\w \uf0a9 '
PS1="\[\e]0;\w\a\]$PS1"
