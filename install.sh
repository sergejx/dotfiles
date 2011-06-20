#!/bin/sh

function link_file() {
    name=$HOME/$1
    target=$PWD/$1
    if [ -e $name ]; then
        if [ -L $name ]; then
            if [ $target != $(readlink $name) ]; then
                echo "Link $1 exists, but points to different file."
            fi
        else
            echo "File $1 already exists."
        fi
    else
        echo "Linking $1"
        ln -s $target $name
    fi
}

# main
for f in .*; do
case "$f" in
        . | .. | .git | .local ) ;;
        * ) link_file $f ;;
    esac
done
for f in .local/bin/*; do
    link_file $f
done
