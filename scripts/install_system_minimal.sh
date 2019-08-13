#!/bin/bash

set -euo pipefail

if command -v pacman >/dev/null; then
  sudo pacman -S --noconfirm --needed zsh tmux fasd xclip vim git words
elif command -v apt-get >/dev/null; then
  # sudo add-apt-repository ppa:aacebedo/fasd
  # sudo apt-get update
  # sudo apt-get install fasd zsh tmux xclip vim git wamerican
  echo
else
  echo "Only arch and debian is supported"
  exit 1
fi
