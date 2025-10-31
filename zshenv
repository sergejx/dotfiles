if [ -d ~/.local/bin ]; then
    export PATH=$HOME/.local/bin:$PATH
fi
if [ -d $HOME/.local/share/JetBrains/Toolbox/scripts ]; then
    export PATH="$PATH:$HOME/.local/share/JetBrains/Toolbox/scripts"
fi


export EDITOR=nvim
export BROWSER=brave-browser
export TERMINAL=ghostty
export GEM_HOME=$HOME/.local/gems
export ELECTRON_OZONE_PLATFORM_HINT=auto
