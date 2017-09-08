
stty -ixon

# Source zim
if [[ -s ${ZDOTDIR:-${HOME}}/.zim/init.zsh ]]; then
  source ${ZDOTDIR:-${HOME}}/.zim/init.zsh
fi

unsetopt autocd
unsetopt extendedglob
bindkey -e
# bash style comment
bindkey '\e#' pound-insert
setopt interactivecomments
# allow to trunk file with >
setopt clobber

# The following lines were added by compinstall
zstyle :compinstall filename '/home/mat/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

eval "$(fasd --init auto posix-alias zsh-ccomp-install)"



source ~/.dotfiles/keybindings.sh
source ~/.dotfiles/aliases.sh
source ~/.dotfiles/prompt_zsh.sh

