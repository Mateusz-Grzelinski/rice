#!/bin/bash

rm -rf "$HOME"/.config/nvim
rm -rf "$HOME"/.vim
mkdir -p "$HOME"/config
git clone git://github.com/Mateusz-Grzelinski/nvim-config.git "$HOME"/.config/nvim
ln -s "$HOME"/.config/nvim "$HOME"/.vim
