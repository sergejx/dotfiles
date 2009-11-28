# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

if [ -d ~/bin ]; then
    PATH=$HOME/bin:$PATH
    export PATH
fi

export LC_ALL="sk_SK.utf8"

export EDITOR=vim
export BROWSER=firefox
export LESSCHARSET="utf-8"
export DARCS_DONT_ESCAPE_8BIT=1
export DARCS_ALWAYS_COLOR=1
