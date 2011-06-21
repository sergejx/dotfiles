# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

if [ -d ~/.local/bin ]; then
    PATH=$HOME/.local/bin
    export PATH
fi

export EDITOR=vim
export BROWSER=firefox
export LESSCHARSET="utf-8"
export DARCS_DONT_ESCAPE_8BIT=1
export DARCS_ALWAYS_COLOR=1
