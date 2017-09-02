

bindkey -s "" "fuck\n"
bindkey -s "" "clear\n"

# bring back delete key
bindkey "\e[3~" delete-char


# cd
	# Custom cd
	my_cd() {
		cd $1;
		ls | head -n 30 | ls;
	}
alias cd="my_cd"

# up
	function up_widget() {
		BUFFER="cd .."
		zle accept-line
	}
	zle -N up_widget
	bindkey "" up_widget

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
	bindkey "^v" edit_and_run

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
