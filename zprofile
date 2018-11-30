if [ -d ~/.local/bin ]; then
    export PATH=$HOME/.local/bin:$PATH
fi

export EDITOR=vim
export BROWSER=firefox
export TERMINAL=gnome-terminal
export PROJECT_HOME=~/Code
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
export ELECTRON_TRASH=gio

module load mpi/mpich-x86_64
export C_INCLUDE_PATH=$MPI_INCLUDE
