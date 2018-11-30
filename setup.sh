#!/bin/zsh

dotfiles=('atom' 'gitconfig' 'vim' 'vimrc' 'zimrc' 'zlogin' 'zprofile' 'zshrc')
dotfiles_dir="$HOME/Code/dotfiles"

for item in "${dotfiles[@]}"; do
    echo "\n$dotfiles_dir/$item -> $HOME/.$item"
    ln -Tis "$dotfiles_dir/$item" "$HOME/.$item"
done
