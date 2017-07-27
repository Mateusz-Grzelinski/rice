
stty -ixon

#
# User configuration sourced by interactive shells
#

# source ~/antigen.zsh
# Source zim
if [[ -s ${ZDOTDIR:-${HOME}}/.zim/init.zsh ]]; then
  source ${ZDOTDIR:-${HOME}}/.zim/init.zsh
fi

export EDITOR="vim"

#
# User configuration sourced by interactive shells
#
alias la="ls -ahF"
alias ez="vim ~/.zshrc"
alias sz="source ~/.zshrc"
alias eb="vim ~/.bashrc"
alias sb="source ~/.bashrc"
alias svim="sudo vim"
alias stop="systemctl stop"
alias status="systemctl status"
alias status="systemctl status"
alias start="systemctl start"

eval "$(fasd --init auto posix-alias zsh-ccomp-install)"
alias a='fasd -a'        # any
alias s='fasd -si'       # show / search / select
alias d='fasd -d'        # directory
alias f='fasd -f'        # file
alias sd='fasd -sid'     # interactive directory selection
alias sf='fasd -sif'     # interactive file selection
alias z='fasd_cd -d'     # cd, same functionality as j in autojump
alias zz='fasd_cd -d -i' # cd with interactive selection

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

RPROMPT="%n"
export RPROMPT

# completion
# fpatch=(/home/mat/.antigen/bundles/srijanshetty/zsh-pip-completion $fpath)
autoload -Uz compinit
compinit
# End of lines added by compinstall


# define shortcusts (widgets first)

bindkey -s "" "fuck\n"
bindkey -s "" "clear\n"
