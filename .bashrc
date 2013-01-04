# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions

# Prompt
PS1='\[\e[0;32m\]\u@\h \[\e[1;34m\]\w \[\e[0;34m\]\$ \[\e[m\]'

# Bash options
HISTSIZE=10000
HISTFILESIZE=10000
HISTCONTROL=ignoreboth
shopt -s histappend
shopt -s globstar

# Aliases and functions

alias ge="outofterm gedit"
alias nau="outofterm nautilus ."

function svndiff () { svn diff $@ | colordiff |less -R; }

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

