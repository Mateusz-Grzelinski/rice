

#edit command on the fly in vim
# autoload edit-command-line
# zle -N edit-command-line
# bindkey '^X^e' edit-command-line


# bring back delete key
bindkey "\e[3~" delete-char


# cd
	# Custom cd
    # when going up run ls, when down (..) oly pwd
	function my_cd() {
        if [ -z "$1" ]; 
        then 
            cd
        elif [ "$1" = ".." ]; 
        then 
            cd ..; 
            pwd;
	    else
            cd $1;
            ls --color=always --format=vertical | head -n 5 ;
            echo "And more..."
        fi
    }
    bindkey -s "" "cd ..\n"
    # zle -N my_cd
    # bindkey "" "my_cd .."

# alias cd="my_cd"

# up
	# function up_widget() {
	#     BUFFER="cd .."
	#     zle accept-line
	# }
	# zle -N up_widget
	# bindkey "" up_widget

# git
	# function git_prepare() {
	#     if [ -n "$BUFFER" ];
	#         then
	#             BUFFER="git add -A; git commit -m \"$BUFFER\" && git push"
	#     fi

	#     if [ -z "$BUFFER" ];
	#         then
	#             BUFFER="git add -A; git commit -v && git push"
	#     fi
				
	#     zle accept-line
	# }
	# zle -N git_prepare
	# bindkey "^g" git_prepare

# home
	# function goto_home() { 
	#     BUFFER="cd ~/"$BUFFER
	#     zle end-of-line
	#     zle accept-line
	# }
	# zle -N goto_home
	# bindkey "^h" goto_home

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
