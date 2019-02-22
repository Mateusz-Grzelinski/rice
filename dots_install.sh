#!/bin/bash
#
# Script will install custom dotfiles from repo:
# https://github.com/Mateusz-Grzelinski/.dotfiles
# Script will:
#   make backup of current dotfiels (if necessary)
#   install fasd, vim (and plugins), zsh (with zim), custom prompt

# TODO: learn to use local variables and return statements

# set -x # for debugging

ask_loop() {
  # funtion for yes/no dialog
  # $1 loop mesage
  # $2 yes funtion
  # $3 no function
  message="$1(y/n)"
  yes_function=${2:-"echo Accepted"}
  no_function=${3:-"echo Aborted"}
  while read -rp "$message" yn;
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
  backup_dir="$HOME/.backup-dotfiles"
  # test -d "$backup_dir" || return 0
  ((i=1))
  while test -d "${backup_dir}${i}";
  do
    ((i+=1))
  done
  backup_dir="${backup_dir}${i}"
}

yes_do_backup() {
  unique_backup_dir
  mkdir -p "$backup_dir"
  # take all files listed in $dotfiles_dest and copy them
  i=0
  while [ $i -lt ${#dotfiles_dest[*]} ]; do
    file=${dotfiles_dest[$i]}
    cp -pr "$HOME/$file" "$backup_dir/$file"
    ((i++))
  done

  # save addition files not listed in $dotfiles_dest
  cp -pr "$HOME"/{.zimrc,.zlogin,.zim,.config/nvim} "$backup_dir"/
  echo -e "Backup done. Path: $backup_dir \n\n"
}

make_backup() {
  message="Make backup of dotfiles (zshrc, zimrc, zlogin, vimrc, .vim, .config/nvim, tmux.conf)? "
  ask_loop "$message" yes_do_backup
}

link_dotfiles() {
  echo "Linking dotfiles in $HOME to $HOME/.dotfiles"
  i=0
  while [ $i -lt ${#dotfiles_src[*]} ] ; do
    file_src="${dotfiles_src[i]}";
    rm -rf "${HOME:?}/$file_src"
    echo "source ~/.dotfiles/${file_src}" > "$HOME/${dotfiles_dest[$i]}";
    ((i++))
  done
  # TODO: change zlogin to file template
  echo '[[ -s ${ZIM_HOME}/login_init.zsh ]] && source ${ZIM_HOME}/login_init.zsh' >> "$HOME"/.zlogin
}

install_nvim() {
  rm -rf "$HOME"/.config/nvim
  rm -rf "$HOME"/.vim
  mkdir -p "$HOME"/config
  git clone git://github.com/Mateusz-Grzelinski/nvim-config.git "$HOME"/.config/nvim
  ln -s "$HOME"/.config/nvim "$HOME"/.vim
}

install_zim() {
  rm -rf "$HOME"/.zim
  /bin/zsh -c "git clone --recursive https://github.com/Eriner/zim.git ${ZDOTDIR:-${HOME}}/.zim >/dev/null"
}

install_fonts() {
  # add https://github.com/tonsky/FiraCode ?
  current_dir="$( cd "$( dirname "$0" )" && pwd )"
  font_dir="$HOME/.local/share/fonts"
  mkdir -p "$font_dir" || return
  cd "$font_dir" || return
  wget https://github.com/powerline/fonts/blob/master/Cousine/Cousine%20Bold%20Italic%20for%20Powerline.ttf?raw=true
  wget https://github.com/powerline/fonts/blob/master/Cousine/Cousine%20Bold%20for%20Powerline.ttf?raw=true
  wget https://github.com/powerline/fonts/blob/master/Cousine/Cousine%20Italic%20for%20Powerline.ttf?raw=true
  wget https://github.com/powerline/fonts/blob/master/Cousine/Cousine%20for%20Powerline.ttf?raw=true
  cd "$current_dir" || return
}

extras() {
  if [ "$SHELL" != "/bin/zsh" ]; then
    ask_loop "Change default shell to zsh?" "chsh -s /bin/zsh"
  fi
}

main() {
  dotfiles_src=("zsh/zshrc" "tmux.conf" "zsh/zimrc" )
  dotfiles_dest=(".zshrc" ".tmux.conf" ".zimrc" )

  echo -e "This script will configure dotfiles for: \\n \
  zsh with zim, vim/neovim with plugins, tmux (compatible with vim). "
  echo "You should have fasd and zsh installed"

  # make_backup
  # link_dotfiles
  # install_nvim
  # install_zim
  install_fonts
  # extras
}

main "$@"

