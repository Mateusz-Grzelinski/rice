
bindkey -e
# bring back delete key
bindkey "\e[3~" delete-char
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward
# bash style comment
bindkey '\e#' pound-insert
setopt interactivecomments

# clear screen with alt-l
bindkey -s 'l' 'clear\n' 

# fast loop
    function fast_loop() {
        while [ true ];
        do
            $BUFFER
            sleep 0.4
        done
    }
    zle -N fast_loop
bindkey "" fast_loop

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

