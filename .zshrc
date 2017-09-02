
stty -ixon

#
# User configuration sourced by interactive shells
#

# source ~/antigen.zsh
# Source zim
if [[ -s ${ZDOTDIR:-${HOME}}/.zim/init.zsh ]]; then
  source ${ZDOTDIR:-${HOME}}/.zim/init.zsh
fi

#
# User configuration sourced by interactive shells
#

eval "$(fasd --init auto posix-alias zsh-ccomp-install)"
source ~/.dotfiles/.aliases 
eval $(thefuck --alias)


# plugins=(zsh-completions zsh-pip-completion)

# HISTFILE=~/.zhistfile
# HISTSIZE=1000
# SAVEHIST=1000
unsetopt autocd
unsetopt extendedglob
bindkey -e
# bash style comment
bindkey '\e#' pound-insert
setopt interactivecomments
# allow to trunk file with >
setopt clobber

# bindkey '\e.' insert-last-word
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/mat/.zshrc'

# RPROMPT="%n"
# export RPROMPT

# completion
# fpatch=(/home/mat/.antigen/bundles/srijanshetty/zsh-pip-completion $fpath)
autoload -Uz compinit
compinit
# End of lines added by compinstall


# define shortcuts (widgets first)

bindkey -s "" "fuck\n"
bindkey -s "" "clear\n"

# bring back delete key
bindkey "\e[3~" delete-char

source ~/.dotfiles/prompt_zsh.sh
