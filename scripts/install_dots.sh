#!/bin/bash
#
# Install custom dotfiles from repo: https://github.com/Mateusz-Grzelinski/.dotfiles
# Script will:
#   make backup of current dotfiels (if necessary)
#   install fasd, vim (and plugins), zsh (with zim), custom prompt

set -euo pipefail

# basename for backup dir
BACKUP_DIR="$HOME/.backup-dotfiles"

DOTFILES_SRC=("zsh/zshrc" "tmux.conf" "zsh/zimrc")
DOTFILES_DST=(".zshrc" ".tmux.conf" ".zimrc")

# add prefix to source files relative to git root
DOTFILES_SRC=("${DOTFILES_SRC[@]/#/$(git rev-parse --show-toplevel)/}")
# add prefix $HOME
DOTFILES_DST=("${DOTFILES_DST[@]/#/$HOME/}")

# Ask for confirmation in loop
# Globals:
#   None
# Arguments:
#   $1 optional - loop mesage
#   $2 optional - yes funtion callback
#   $3 optional - no function callback
# Returns:
#   None
ask_loop() {
  # funtion for yes/no dialog
  local message yes_function no_function yn
  message="$1(y/n)"
  yes_function=${2:-"echo Accepted"}
  no_function=${3:-"echo Aborted"}
  while read -rp "$message" yn; do
    case $yn in
    t | T | tak | Tak | y | Y | yes | Yes)
      $yes_function
      break
      ;;
    n | N | nie | Nie | no | No)
      $no_function
      break
      ;;
    esac
  done
}

# Generate non existing directory path by giving it number
# Calling multiple times on one variable will append number, not increment
# Globals:
#   None
# Arguments:
#   $1 optional - directory
# Returns:
#   Unique dir
unique_dir() {
  if [[ ! -d "$1" && -n "$1" ]]; then
    echo "$1"
    return 0
  fi

  local i=1
  while test -d "$1${i}"; do
    ((i += 1))
  done
  echo "$1${i}"
}

yes_do_backup() {
  local backup_dir file files_to_backup
  backup_dir=$(unique_dir "$BACKUP_DIR")
  files_to_backup=("${DOTFILES_DST[@]}" "${HOME}/.zim")

  mkdir -p "$backup_dir"

  for file in "${files_to_backup[@]}"; do
    echo $file
    if [ -e "$file" ]; then
      cp -pr -- "$file" "$backup_dir/"
    fi
  done

  # cp -pr "$HOME"/.zim "$BACKUP_DIR"/
  echo -e "Backup done to $backup_dir \n"
}

override_dotfiles() {
  # execute script in the same dir
  ./"$(dirname "$0")"/install_zim.zsh

  echo "Add hooks for ${DOTFILES_SRC[*]} in $HOME"

  local i=0 file_src file_dst
  while [ $i -lt ${#DOTFILES_SRC[*]} ]; do
    file_src="${DOTFILES_SRC[$i]}"
    file_dst="${DOTFILES_DST[$i]}"
    rm -rf "$file_dst"
    echo "source ${file_src}" >"$file_dst"
    ((i += 1))
  done


}

main() {
  local message

  local src_basename=("${DOTFILES_DST[@]##*/}")
  ask_loop "Make backup of: ${src_basename[*]} .zim?" yes_do_backup

  override_dotfiles

  if [ "$SHELL" != "/bin/zsh" ]; then
    ask_loop "Change default shell to zsh?" "sudo chsh -s /bin/zsh"
  fi

  echo "All done"
}

main "$@"
