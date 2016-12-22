#!/bin/sh

dotfiles=('gitconfig' 'vim' 'vimrc' \
          'zlogin' 'zpreztorc' 'zprofile' 'zshenv' 'zshrc')
dotfiles_dir="$HOME/Code/dotfiles"

for item in "${dotfiles[@]}"; do
    echo "$dotfiles_dir/$item" "$HOME/.$item"
    ln -is "$dotfiles_dir/$item" "$HOME/.$item"
done
