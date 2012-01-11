# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions

# Prompt
PS1='\[\e[0;32m\]\u@\h \[\e[1;34m\]\W \[\e[0;34m\]\$ \[\e[m\]'

# Bash options
export HISTSIZE=5000
shopt -s histappend

# Aliases and functions

function history_top () {
  history | awk '{a[$2]++}END{for(i in a){print a[i] " " i}}' | sort -rn | head
}
