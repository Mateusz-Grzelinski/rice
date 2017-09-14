
export EDITOR="vim"

alias la="ls -ahF"
alias ll="ls -lh" 
# alias cd="my_cd" #function defined in ./.keybindings.sh

alias ez="vim ~/.dotfiles/zshrc"
alias eb="vim ~/.dotfiles/bashrc"
alias et="vim ~/.dotfiles/tmux.conf"
alias ea="vim ~/.dotfiles/aliases.sh"
alias ek="vim ~/.dotfiles/keybindings.sh"
alias ezz="vim ~/.dotfiles/zimrc"
alias cdvim="cd ~/.dotfiles/.vim/bundle"
alias sz="source ~/.zshrc"
alias sb="source ~/.bashrc"
alias st="source ~/.tmux.conf"
alias sa="source ~/.dotfiles/.aliases"

alias ag="alias | grep -i "

alias svim="sudo -e vim"

alias stop="systemctl stop"
alias status="systemctl status"
alias start="systemctl start"

# don't show not readable files while searching
alias findr="find ! -readable -prune -o"
alias blender="optirun ~/Pulpit/blender-2.78/blender"

alias a='fasd -a'        # any
alias s='fasd -si'       # show / search / select
alias d='fasd -d'        # directory
alias f='fasd -f'        # file
alias sd='fasd -sid'     # interactive directory selection
alias sf='fasd -sif'     # interactive file selection
alias z='fasd_cd -d'     # cd, same functionality as j in autojump
alias zz='fasd_cd -d -i' # cd with interactive selection

alias esshd="svim /etc/ssh/sshd_config"
alias essh="svim /etc/ssh/ssh_config"

alias c="xclip"
alias v="xclip -o"

alias externalip="lynx -dump -hiddenlinks=ignore -nolist http://checkip.dyndns.org:8245/ | awk '{ print $4 }' | sed '/^$/d; s/^[ ]*//g; s/[ ]*$//g'"


