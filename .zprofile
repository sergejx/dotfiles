if [ -d ~/.local/bin ]; then
    export PATH=$HOME/.local/bin:$PATH
fi

if [ -d ~/.cabal/bin ]; then
    export PATH=$HOME/.cabal/bin:$PATH
fi

export EDITOR=vim
export BROWSER=firefox
export LESSCHARSET="utf-8"
export DARCS_DONT_ESCAPE_8BIT=1
export DARCS_ALWAYS_COLOR=1

