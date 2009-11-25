#!/bin/sh
for f in .*; do
    case "$f" in
        . | .. | .git)  ;;
        * )             ln -s $PWD/$f $HOME/$f;;
    esac
done
for f in bin/*; do
    ln -s $PWD/$f $HOME/$f
done
