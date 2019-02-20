#!/bin/bash

#### Script is used to automate personal system installation in arch environment ####

echo "Read the script!! Many programs will be installed"
read -r

# secret weapons
sudo pacman -S bat fd diff-so-fancy dmenu ncdu tldr entr glances

# Programs I always use
sudo pacman -S --noconfirm chromium \
  yaourt fasd xclip borg vim neovim powerline shellcheck clang ctags ipython autopep8 flake8 eslint tmux wget tree python-kivy ack zsh python-virtualenvwrapper pip\
  blender krita inkscape handbrake darktable virtualbox texmaker  syncthing-gtk hplip bleachbit \
  eclipse-common eclipse-java atom netbeans make cmake \
  gitg nautilus flatix-theme-dark breeze-icons

# commonly used packages
pip3 install --user rope jedi cookiecutter lice PyYAML numpy neovim

# python linters (from neovim)
pip install --user pycodestyle pyflakes flake8 vim-vint proselint yamllint

# mostly heavy duty programs
yaourt -S --noconfirm \
  dropbox spotify \
  clion pycharm-professional \
  substance-designer substance-painter \
  nautilus-dropbox \
  fpp-git gcalcli


# fix for clion (ncurses)
# gpg --recv-keys 702353E0F7E48EDB

### usefull hacks: ####
# favourite font:
#   https://github.com/powerline/fonts/tree/master/Cousine

# other power fonts:
# wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
# sudo mv PowerlineSymbols.otf /usr/share/fonts/
# sudo fc-cache -vf
# sudo mv 10-powerline-symbols.conf /etc/fonts/conf.d/
# https://askubuntu.com/questions/283908/how-can-i-install-and-use-powerline-plugin

# make /tmp bigger:
# mount -o remount,size=16G,noatime /tmp

