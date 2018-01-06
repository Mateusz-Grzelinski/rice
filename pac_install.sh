#!/bin/bash

echo "Read the script!! Many programs will be installed"
read
sudo pacman -S --noconfirm blender krita inkscape cmake handbrake darktable yaourt virtualbox fasd texmaker grsync syncthing-gtk xclip borg python-pyqt5 manjaro-printer hplip vim neovim python-neovim bleachbit codeblocks eclipse-common eclipse-java atom netbeans shellcheck clang ctags ipython powerline python-ipdb python-pytest python-jedi python-numpy autopep8 flake8 eslint gitg wget tmux ksysguard xfce4 xfce4-goodies root tree

pip3 install --user rope vim-vint proselint htmlhint 

yaourt -S --noconfirm dropbox spotify clion pycharm-professional unity-editor chrome cling-git

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
sudo pacman -S linux49-virtualbox-host-modules
sudo /sbin/rcvboxdrv setup
