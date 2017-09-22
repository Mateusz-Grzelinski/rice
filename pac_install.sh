#!/bin/bash

echo "Read the script!! Many programs will be installed"
read
sudo pacman -S --noconfirm blender vim cmake ctags handbrake darktable yaourt virtualbox linux49-virtualbox-host-modules linux49-virtualbox-guest-modules fasd texmaker unison grsync xclip dropbox python-numpy borg pyqt5 kodi hplip neovim bleachbit codeblocks shellcheck clang

sudo pip3 install jedi pytest nose numpy

yaourt -S --noconfirm spotify clion pycharm-professional unity-editor chrome



