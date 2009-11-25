#!/bin/sh
for f in bin/*; do
    ln -is $PWD/$f $HOME/$f
done
