
bindkey -e
# bring back delete key
bindkey "\e[3~" delete-char
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

# for tmux
bindkey "" history-beginning-search-backward
bindkey "" history-beginning-search-forward

# bash style comment
bindkey '\e#' pound-insert
setopt interactivecomments

# clear screen with alt-l
bindkey -s 'l' 'clear\n'

# fast watch
function fast_watch() {
    watch -n 0.5 "$BUFFER"
}

zle -N fast_watch
bindkey "" fast_watch

# up
function up_widget() {
    BUFFER="cd .."
    zle accept-line
}

zle -N up_widget
bindkey "" up_widget

# Edit and rerun
function edit_and_run() {
  BUFFER="fc"
  zle accept-line
}

zle -N edit_and_run
bindkey "" edit_and_run

# LS
function ctrl_l() {
  BUFFER="ls"
  zle accept-line
}
zle -N ctrl_l
# bindkey "^l" ctrl_l

# Enter
function enter_line() {
  zle accept-line
}

zle -N enter_line
bindkey "^o" enter_line

# Sudo
function add_sudo() {
  BUFFER="sudo "$BUFFER
  zle end-of-line
}

zle -N add_sudo
bindkey "^s" add_sudo

# Fasd
bindkey '^X^A' fasd-complete    # C-x C-a to do fasd-complete (fils and directories)
bindkey '^X^F' fasd-complete-f  # C-x C-f to do fasd-complete-f (only files)
bindkey '^X^D' fasd-complete-d  # C-x C-d to do fasd-complete-d (only directories)

# <C-z> pause/go back to vim
# https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/fancy-ctrl-z
fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}

zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z


# https://github.com/robbyrussell/oh-my-zsh/blob/master/plugins/copybuffer/copybuffer.plugin.zsh
copybuffer () {
  if which clipcopy &>/dev/null; then
    echo $BUFFER | clipcopy
  else
    echo "clipcopy function not found. Please make sure you have Oh My Zsh installed correctly."
  fi
}

zle -N copybuffer

bindkey "^O" copybuffer

