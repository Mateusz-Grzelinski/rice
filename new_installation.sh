#!/bin/bash 
# 
# Script will install custom dotfiles from repo:
# https://github.com/Mateusz-Grzelinski/.dotfiles
# Script will: 
#   make backup of current dotfiels (if necessary)
#   install fasd, vim (and plugins), zsh (with zim), custom prompt

ask_loop() {
  # funtion for yes/no dialog
  # $1 loop mesage
  # $2 yes funtion
  # $3 no function
  message="$1(y/n)"
  yes_function=${2:-"echo Accepted"}
  no_function=${3:-"echo Aborted"}
  while read -p "$message" yn;
  do
    case $yn in
      t|T|tak|Tak|y|Y|yes|Yes) 
        $yes_function
        break;;
      n|N|nie|Nie|no|No) 
        $no_function
        break;;
    esac
  done
}

unique_backup_dir() {
  test -d $backup_dir || return 0
  let i=1
  while test -d ${backup_dir}${i};
  do
    let i+=1
  done
  backup_dir=${backup_dir}${i}
}

yes_do_backup() {
  unique_backup_dir
  mkdir -p $backup_dir 
  for file in ${dotfiles[@]};
  do
    cp -pr "$HOME/$file" "$backup_dir/$file"
  done
  echo "Backup done. Path: $backup_dir "
}

make_backup() {
  message="Make backup of dotfiles (zshrc, bashrc, vimrc, .vim folder, tmux.conf) "
  backup_dir="$HOME/.backup-dotfiles"
  ask_loop "$message" yes_do_backup   
}

link_dotfiles() {
  echo "Linking dotfiles in $HOME to $HOME/.dotfiles"
  for file in ${dotfiles[@]};
  do 
    # echo ${file:1}
    if [ -d $HOME/$file ];
    then
      rm -rf $HOME/$file
    else
      rm -f $HOME/$file
      echo "source ~/.dotfiles/${file:1}" > $HOME/$file;
    fi
  done
}

install_not_distro_dependent() {
  if [ command -v "$1" &> /dev/null  ]; then
    echo "$1 is installed."
    return 0
  else
    echo "Installing $1"
  fi
  if lsb_release -id | grep -i 'manjaro\|arch' &> /dev/null;
  then 
    sudo pacman -S "$1"  
  elif  lsb_release -id | grep -i 'ubuntu';
  then
    if [ "$1" -eq "fasd" ]; then
      echo "fasd is not in ubuntu repos. Adding it manually:"
      sudo add-apt-repository ppa:aacebedo/fasd
      sudo apt-get update
    fi
    sudo apt install "$1" 
  fi
  # sudo yum install "$@" 2> /dev/null 
  # echo "Programs can not be install. Do it manually"
}


vim_install() {
  rm -rf $HOME/.vim
  git clone https://github.com/VundleVim/Vundle.vim.git \
    ~/.vim/bundle/Vundle.vim &>/dev/null
  vim +PluginInstall +qall 2> /dev/null
}

zim_install() {
  rm -rf $HOME/.zim
  git clone --recursive https://github.com/Eriner/zim.git \
    ${ZDOTDIR:-${HOME}}/.zim >/dev/null
}

install_programs() {
  # programs_to_install=("fasd" "zsh")
  # for program in ${programs_to_install[@]};
  # do
  #   install_not_distro_dependent ${program}
  # done
  # ask_loop "Install vim plugins? " vim_install
  ask_loop "Install zim? " zim_install
}

extras() {
  if [ $SHELL != "/bin/zsh" ]; then 
    ask_loop "Change shell? " "chsh -s /bin/zsh"
  fi
}

main() {
  dotfiles=(".zshrc" ".bashrc" ".vimrc" ".vim" ".tmux.conf" ".zimrc" ".zim")

  echo -e "This script will configure dotfiles for: \n\
  zsh with zim (and nice prompt), \n\
  bash (only aliases), \n\
  vim with plugins, \n\
  tmux (compatible with vim). "

  make_backup
  link_dotfiles
  install_programs
  extras
}

main "$@"
