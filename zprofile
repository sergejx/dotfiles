if [ -d ~/.local/bin ]; then
    export PATH=$HOME/.local/bin:$PATH
fi

export EDITOR=nvim
export BROWSER=firefox
export TERMINAL=gnome-terminal
# export PROJECT_HOME=~/Code
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
export FZF_PREVIEW_COMMAND="highlight -O ansi {}"

# module load mpi/mpich-x86_64
# export C_INCLUDE_PATH=$MPI_INCLUDE
