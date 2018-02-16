#!/bin/bash

echo "Read the script!! Many programs will be installed"
read
sudo pacman -S --noconfirm blender krita inkscape make cmake handbrake darktable yaourt virtualbox fasd texmaker grsync syncthing-gtk xclip borg python-pyqt5 manjaro-printer hplip vim neovim bleachbit eclipse-common atom netbeans shellcheck clang ctags ipython powerline python-ipdb python-pytest python-jedi python-numpy autopep8 flake8 eslint gitg wget tmux ksysguard xfce4-goodies tree python-kivy nautilus nautilus-dropbox zsh 

pip3 install --user rope vim-vint proselint htmlhint tox twine jedi cookiecutter lice

yaourt -S --noconfirm dropbox spotify clion pycharm-professional chrome  nautilus-open-terminal-git komorebi substance-designer substance-painter fpp-git

# fix power fonts
# wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
# sudo mv PowerlineSymbols.otf /usr/share/fonts/
# sudo fc-cache -vf
# sudo mv 10-powerline-symbols.conf /etc/fonts/conf.d/
# https://askubuntu.com/questions/283908/how-can-i-install-and-use-powerline-plugin

# make /tmp bigger:
# mount -o remount,size=16G,noatime /tmp

# Firefox RAM disk
# https://wiki.archlinux.org/index.php/Firefox/Profile_on_RAM
# about:config
# browser.cache.disk.enable to fasle
# browser.cache.memory.enable to true

#fix keys for pacman
# sudo pacman -S archlinux-keyring manjaro-keyring
# sudo pacman-key --populate archlinux manjaro
# sudo pacman-key --refresh

# fix virtual box:
# sudo pacman -S linux49-virtualbox-host-modules
# sudo /sbin/rcvboxdrv setup
