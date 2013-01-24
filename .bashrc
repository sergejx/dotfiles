# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions

# Prompt
PSdir='\[\e[0;32m\]▶ \w\[\e[m\]'
PSusr='\[\e[0;33m\]\u@\[\e[0;35m\]\h \[\e[0;34m\]\$ \[\e[m\]'
PSsmile="\$(if [[ \$? != 0 ]]; then echo \"\[\033[0;31m\]:( \"; fi)\[\033[00m\]"
PS1="$PSdir\n$PSsmile$PSusr"

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

