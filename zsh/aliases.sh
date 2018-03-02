export TERM="xterm-256color" 
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
alias cdvim="cd ~/.vim/bundle"
alias cdnvim="cd ~/.config/nvim/"
alias vims="vim -S .vim_session"
alias sz="source ~/.zshrc"
alias sb="source ~/.bashrc"
alias st="source ~/.tmux.conf"
alias sa="source ~/.dotfiles/.aliases"

alias pypath='export PYTHONPATH=/usr/lib/root:`pwd`'

alias ag="alias | grep -i "

alias svim="sudo -e"

alias stop="systemctl stop"
alias status="systemctl status"
alias start="systemctl start"

# don't show not readable files while searching
alias findr="find ! -readable -prune -o"

if fasd &> /dev/null; then 
    alias a='fasd -a'        # any
    alias s='fasd -si'       # show / search / select
    alias d='fasd -d'        # directory
    alias f='fasd -f'        # file
    alias sd='fasd -sid'     # interactive directory selection
    alias sf='fasd -sif'     # interactive file selection
    alias z='fasd_cd -d'     # cd, same functionality as j in autojump
    alias zz='fasd_cd -d -i' # cd with interactive selection
fi

alias esshd="svim /etc/ssh/sshd_config"
alias essh="svim /etc/ssh/ssh_config"

alias externalip="dig +short myip.opendns.com @resolver1.opendns.com"


