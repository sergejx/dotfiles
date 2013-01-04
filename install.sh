#!/bin/sh

DOTFILES=$HOME/.dotfiles

function link_file() {
    name=$HOME/$1
    target=$DOTFILES/$1
    if [ -L $name ]; then
        if [ $target != $(readlink $name) ]; then
            echo "Link $1 exists, but points to $(readlink $name)"
            echo "Replacing it!"
            rm $name
            ln -s $target $name
        fi
    elif [ -e $name ]; then
        echo "File $1 already exists."
    else
        echo "Linking $1"
        ln -s $target $name
    fi
}

# main
for f in $(ls -a $DOTFILES); do
    case "$f" in
        . | .. | .git | .local | .gitmodules | install.sh ) ;;
        * ) link_file $f ;;
    esac
done
for f in $(ls $DOTFILES/.local/bin); do
    link_file .local/bin/$f
done
