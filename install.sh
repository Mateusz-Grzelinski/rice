#!/bin/bash

# init dotfiles: zsh (zim), bash, (bash-it), vim, tmux

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# vim plugins (color themes):
    # Vim-colors-solarized
    # auto-pairs
    # badwolf
    # clighter8
    # cloning.sh
    # jedi-vim
    # neocomplete.vim
    # nerdcommenter
    # nerdtree
    # syntastic
    # ultisnips
    # vim-airline
    # vim-easy-align
    # vim-fugitive
    # vim-snippets
    # vim-tmux-navigator

# tmux: seamless vim navigation

# git submodule update --init --recursive

echo $BASEDIR
echo $BASH_SOURCE

# make sym links

for file in $BASEDIR/.??*; do 
    ln -s $file ~/
done

# # vim
# ln -s ${BASEDIR}/vimrc ~/.vimrc
# ln -s ${BASEDIR}/vim/ ~/.vim

# # zsh
# ln -s ${BASEDIR}/zshrc ~/.zshrc

# # git
# ln -s ${BASEDIR}/gitconfig ~/.gitconfig

# installation of fasd in ubuntu:
sudo add-apt-repository ppa:aacebedo/fasd
sudo apt-get update
sudo apt-get install fasd
