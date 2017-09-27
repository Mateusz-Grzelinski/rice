#!/bin/bash

echo "Read the script!! Many programs will be installed"
read
sudo pacman -S --noconfirm blender vim cmake handbrake darktable yaourt virtualbox linux49-virtualbox-host-modules linux49-virtualbox-guest-modules fasd texmaker unison grsync xclip dropbox borg pyqt5 kodi hplip neovim bleachbit codeblocks shellcheck clang ctags ipython powerline python-ipdb python-pytest python-nose python-numpy 

sudo pip3 install jedi rope nose numpy vim-vint proselint 

yaourt -S --noconfirm spotify clion pycharm-professional unity-editor chrome cling-git

# fix power fonts
# wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
# sudo mv PowerlineSymbols.otf /usr/share/fonts/
# sudo fc-cache -vf
# sudo mv 10-powerline-symbols.conf /etc/fonts/conf.d/
# https://askubuntu.com/questions/283908/how-can-i-install-and-use-powerline-plugin

# make /tmp bigger:
# mount -o remount,size=16G,noatime /tmp
