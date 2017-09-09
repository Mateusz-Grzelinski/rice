#!/bin/bash

echo "Read the script!! Many programs will be installed"
read
sudo pacman -S --noconfirm blender vim cmake handbrake darktable yaourt virtualbox linux49-virtualbox-host-modules linux49-virtualbox-guest-modules fasd texmaker unison grsync xclip dropbox python-numpy borg pyqt5
sudo pip3 install jedi

yaourt -S --noconfirm spotify clion pycharm-professional unity-editor



