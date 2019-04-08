#!/bin/bash

#### Script is used to automate personal system installation in arch environment ####

echo "Read the script!! Many programs will be installed"
read -r

# secret weapons
sudo pacman -S --noconfirm --needed bat fd diff-so-fancy dmenu ncdu tldr entr glances

# minimum for dotfiles
sudo pacman -S --noconfirm --needed \
  zsh fasd xclip vim tmux tree ack

# programs needed for nvim config
sudo pacman -S --noconfirm --needed \
  neovim python-pip python-yaml python-neovim python-virtualenvwrapper

# neovim linters/formates
sudo pacman -S --noconfirm --needed \
  shellcheck autopep8 flake8 python-pyflakes python-pycodestyle eslint shfmt vint proselint python-jedi yamllint

# common
sudo pacman -S --noconfirm --needed \
  clang ctags ipython wget python-numpy \
  blender gimp texmaker gitg

# editors
sudo pacman -S --noconfirm --needed \
  eclipse-common eclipse-cpp atom netbeans make cmake

#fonts
sudo pacman -S --noconfirm --needed \
  otf-fira-code

# common from AUR
sudo pacman -S --noconfirm --needed yaourt
yay -S --noconfirm --needed \
  python-license python-cookiecutter \
  dropbox spotify \
  clion pycharm-professional

echo "All done!!"

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
