#!/bin/bash

#### Script is used to automate personal system installation in arch environment ####

echo "Read the script!! Many programs will be installed"
read

# Programs I always use
sudo pacman -S --noconfirm chromium blender krita inkscape make cmake handbrake darktable yaourt virtualbox fasd texmaker  syncthing-gtk xclip borg hplip vim neovim bleachbit eclipse-common atom netbeans shellcheck clang ctags ipython powerline autopep8 flake8 eslint gitg wget tmux ksysguard xfce4-goodies tree python-kivy nautilus nautilus-dropbox zsh ack 

# commonly used packages
pip3 install --user rope htmlhint jedi cookiecutter lice PyYAML numpy neovim

# python linters (from neovim)
pip install --user pycodestyle pyflakes flake8 vim-vint proselint yamllint 

# mostly heavy duty programs
yaourt -S --noconfirm dropbox spotify clion pycharm-professional nautilus-open-terminal-git substance-designer substance-painter fpp-git

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

