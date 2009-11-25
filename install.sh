#!/bin/sh
for f in .*; do
    ln -s $PWD/$f $HOME/$f
done
for f in bin/*; do
    ln -s $PWD/$f $HOME/$f
done
