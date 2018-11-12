#!/usr/bin/env bash

sudo pacman -S zsh vim neovim tmux xclip \
  python-pip python-neovim python-pipenv

# install zim
rm -rf "$HOME"/.zim
/bin/zsh -c "git clone --recursive https://github.com/Eriner/zim.git ${ZDOTDIR:-${HOME}}/.zim >/dev/null"
chsh -s /bin/zsh

mkdir -p
# install spacevim
curl -sLf https://spacevim.org/install.sh | bash

# install cousine font
current_dir="$( cd "$( dirname "$0" )" && pwd )"
font_dir="$HOME/.local/share/fonts"
mkdir -p "$font_dir"
cd "$font_dir" || return
wget https://github.com/powerline/fonts/blob/master/Cousine/Cousine%20Bold%20Italic%20for%20Powerline.ttf?raw=true
wget https://github.com/powerline/fonts/blob/master/Cousine/Cousine%20Bold%20for%20Powerline.ttf?raw=true
wget https://github.com/powerline/fonts/blob/master/Cousine/Cousine%20Italic%20for%20Powerline.ttf?raw=true
wget https://github.com/powerline/fonts/blob/master/Cousine/Cousine%20for%20Powerline.ttf?raw=true
cd "$current_dir" || return


# override existing configuration
dotfiles_src=("zsh/zshrc" "tmux.conf" "zsh/zimrc")
dotfiles_dest=(".zshrc" ".tmux.conf" ".zimrc")
echo "Linking dotfiles in $HOME to $HOME/.dotfiles"
for (( i = 0; i < ${#dotfiles_src[@]}; i++ )); do
  src="$current_dir/${dotfiles_src[i]}"
  dest="$HOME/${dotfiles_dest[i]}"
  echo "source $src" > "$dest"
done

ln -s "current_dir/SpaceVim.d/init.toml" "$HOME/.SpaceVim.d/init.toml"

# TODO: change zlogin to file template
echo '[[ -s ${ZIM_HOME}/login_init.zsh ]] && source ${ZIM_HOME}/login_init.zsh' >> "$HOME"/.zlogin
