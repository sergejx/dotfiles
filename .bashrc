# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions


# Completion
source ~/bin/bash-completion-django.sh
source ~/bin/bash-completion-eg.sh

# Prompt helper functions
function parse_git_dirty {
    [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}
function parse_git_branch {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}

# Prompt
prompt_func()
{
    PREV_RET_VAL=$?;

    PS1='\[\e[0;32m\]\u@\h \[\e[1;34m\]\W\[\e[0;33m\]$(parse_git_branch) \[\e[0;34m\]\$ \[\e[m\]'

    if test $PREV_RET_VAL != 0
    then
        PS1="[${PREV_RET_VAL}] ${PS1}"
    fi

    #history -n
    history -a
}
if [ "$TERM" != "dumb" ]; then
    export PROMPT_COMMAND=prompt_func
fi

# Bash options
export HISTSIZE=5000
shopt -s histappend

# Aliases and functions

function history_top () {
  history | awk '{a[$2]++}END{for(i in a){print a[i] " " i}}' | sort -rn | head
}
