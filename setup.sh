#!/bin/zsh

dotfiles=('gitconfig' 'vim' 'vimrc' 'zimrc' 'zlogin' 'zshenv' 'zshrc')
dotfiles_dir="$HOME/Code/dotfiles"

for item in "${dotfiles[@]}"; do
    echo "$dotfiles_dir/$item" "$HOME/.$item"
    ln -Tis "$dotfiles_dir/$item" "$HOME/.$item"
done
