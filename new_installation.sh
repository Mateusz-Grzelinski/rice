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

install_arch_only() {
  if [ command -v "$1" &> /dev/null  ]; then
    echo "$1 is installed."
    return 0
  else
    echo "Installing $1"
  fi
  if lsb_release -id | grep -i 'manjaro\|arch' &> /dev/null;
  then 
    sudo pacman -S "$1"  
  fi
  # sudo yum install "$@" 2> /dev/null 
  # echo "Programs can not be install. Do it manually"
}

# zim_install() {
#   rm -rf $HOME/.zim
#   git clone --recursive https://github.com/Eriner/zim.git ${ZDOTDIR:-${HOME}}/.zim >/dev/null

#   setopt EXTENDED_GLOB
#   for template_file ( ${ZDOTDIR:-${HOME}}/.zim/templates/* ); do
#     user_file="${ZDOTDIR:-${HOME}}/.${template_file:t}"
#     touch ${user_file}
#     ( print -rn "$(<${template_file})$(<${user_file})" >! ${user_file} ) 2>/dev/null
#   done

#   source ${ZDOTDIR:-${HOME}}/.zlogin
# }

install_programs() {
  programs_to_install=("fasd" "zsh")
  sudo pacman -S programs_to_install[*]
  ask_loop "Install zim? " zim_install
}

extras() { if [ $SHELL != "/bin/zsh" ]; then 
    ask_loop "Change default shell? " "chsh -s /bin/zsh"
  fi
}

main() {
  dotfiles=(".zshrc" ".bashrc" ".vimrc" ".vim" ".tmux.conf" ".zimrc" ".zim")

  echo -e "This script will configure dotfiles for: \n\
  zsh with zim (and nice prompt), \n\
  bash (only aliases), \n\
  vim with plugins, \n\
  tmux (compatible with vim). "

  echo "RUN IN ZSH"

  make_backup
  # install_programs
  link_dotfiles
  extras

  echo '
  git clone --recursive https://github.com/Eriner/zim.git ${ZDOTDIR:-${HOME}}/.zim >/dev/null

  setopt EXTENDED_GLOB
  for template_file ( ${ZDOTDIR:-${HOME}}/.zim/templates/* ); do
    user_file="${ZDOTDIR:-${HOME}}/.${template_file:t}"
    touch ${user_file}
    ( print -rn "$(<${template_file})$(<${user_file})" >! ${user_file} ) 2>/dev/null
  done

  source ${ZDOTDIR:-${HOME}}/.zlogin
  '
}

main "$@"
