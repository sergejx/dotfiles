if [ -d ~/.local/bin ]; then
    export PATH=$HOME/.local/bin:$PATH
fi
if [ -d $HOME/.local/share/JetBrains/Toolbox/scripts ]; then
    export PATH="$PATH:$HOME/.local/share/JetBrains/Toolbox/scripts"
fi


export EDITOR=vim
export BROWSER=firefox
export TERMINAL=kgx
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
export ON_COLOR=blue
