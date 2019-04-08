#!/bin/zsh

rm -rf "$HOME"/.zim

echo "Cloning zim"
git clone --quiet --recursive https://github.com/Eriner/zim.git ${ZDOTDIR:-${HOME}}/.zim

echo "Copy templates"
for template_file in ${ZDOTDIR:-${HOME}}/.zim/templates/*; do
  user_file="${ZDOTDIR:-${HOME}}/.${template_file:t}"
  cat ${template_file} ${user_file}(.N) > ${user_file}.tmp && mv ${user_file}{.tmp,}
done

source ${ZDOTDIR:-${HOME}}/.zlogin

echo "Zim installed"

