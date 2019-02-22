export EDITOR="nvim"

alias la="ls -ahF"
alias ll="ls -lhF"

alias ez="vim ~/.dotfiles/zshrc"
alias ezz="vim ~/.zshrc"
alias eb="vim ~/.dotfiles/bashrc"
alias ebb="vim ~/.bashrc"
alias et="vim ~/.dotfiles/tmux.conf"
alias ett="vim ~/.tmux.conf"
alias ez="vim ~/.dotfiles/zimrc"
alias ezz="vim ~/.zimrc"
alias ea="vim ~/.dotfiles/aliases.sh"
alias ek="vim ~/.dotfiles/keybindings.sh"
alias cdnvim="cd ~/.config/nvim/"
alias vims="vim -S .vim_session"
alias sz="source ~/.zshrc"
alias sb="source ~/.bashrc"
alias st="source ~/.tmux.conf"
alias sa="source ~/.dotfiles/.aliases"

alias pypath='export PYTHONPATH=/usr/lib/root:`pwd`'

alias SS="sudo systemctl"
alias stop="systemctl stop"
alias status="systemctl status"
alias start="systemctl start"

# don't show not readable files while searching
alias findr="find ! -readable -prune -o"

alias esshd="svim /etc/ssh/sshd_config"
alias essh="svim /etc/ssh/ssh_config"

alias c="clipcopy"

# if comand exists
if [ -x "$(command -v pacman)" ]; then
  alias p="sudo pacman -S"
fi

