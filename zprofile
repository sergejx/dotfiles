#
# Executes commands at login pre-zshrc.
#

export BROWSER='xdg-open'
export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'
export TERMINAL='gnome-terminal'

export LESSCHARSET="utf-8"

#
# Paths
#

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

# Set the the list of directories that cd searches.
# cdpath=(
#   $cdpath
# )

# Set the list of directories that Zsh searches for programs.
path=(
  ~/.local/bin
  $path
)
