# It is ripof from: https://github.com/Parth/dotfiles
# Sory. Don't want to clone single file.
# Reference for colors: http://stackoverflow.com/questions/689765/how-can-i-change-the-color-of-my-prompt-in-zsh-different-from-normal-text

autoload -U colors && colors

setopt PROMPT_SUBST
REMOTE_FS=false

set_prompt() {

  # Sudo: https://superuser.com/questions/195781/sudo-is-there-a-command-to-check-if-i-have-sudo-and-or-how-much-time-is-left
  CAN_I_RUN_SUDO=$(sudo -n uptime 2>&1|grep "load"|wc -l)
  if [ ${CAN_I_RUN_SUDO} -gt 0 ]
  then
    BRACES_COLOR=red
  else
    BRACES_COLOR=white
  fi

  PS1="%{$fg[$BRACES_COLOR]%}[%{$reset_color%}"

  # Path: http://stevelosh.com/blog/2010/02/my-extravagant-zsh-prompt/
  PS1+="%{$fg_bold[cyan]%}$(shrink_path -f)%{$reset_color%}"

  # Status Code
  PS1+='%(?.., %{$fg[red]%}%?%{$reset_color%})'

  # add some spaces to make RPROMPT disapper faster
  RPROMPT="                   %n@%m"

  if [[ $PROMPT_SHOW_PARTITION = true ]]; then
    FS=$(df | grep "$(stat --format %m .)$" | tr -s ' ')
    # current partition
    PARTITION=$(echo ${FS} | cut -f1 -d' ')
    # used momory on current partition
    USED=$(echo ${FS} | cut -f5 -d' ')

    RPROMPT+=":%{$fg[green]%}"
    RPROMPT+="${PARTITION}"
    RPROMPT+="%{$fg[white]%}"
    RPROMPT+=","
    RPROMPT+="%{$fg[blue]%}"
    RPROMPT+="${USED}%"
    RPROMPT+="%{$fg[white]%}"

    # make prompt less bloated when using remote fs
    if [[ ${PARTITION} == /* ]]; then
      REMOTE_FS=false
    else
      REMOTE_FS=true
    fi
  fi

  # Git
  if [[ $PROMPT_SHOW_GIT = true && $REMOTE_FS = false ]]; then
    if git rev-parse --is-inside-work-tree 2> /dev/null | grep -q 'true' ; then
      PS1+=', '
      PS1+="%{$fg[blue]%}$(git rev-parse --abbrev-ref HEAD 2> /dev/null)%{$reset_color%}"
      if [ $(git status --short | wc -l) -gt 0 ]; then
        PS1+="%{$fg[red]%}+$(git status --short | wc -l | awk '{$1=$1};1')%{$reset_color%}"
      fi
    fi
  fi

  if [[ $PROMPT_SHOW_TIME = true ]]; then
    # Timer: http://stackoverflow.com/questions/2704635/is-there-a-way-to-find-the-running-time-of-the-last-executed-command-in-the-shel
    if [[ $_elapsed[-1] -ne 0 ]]; then
      PS1+=', '
      PS1+="%{$fg[magenta]%}$_elapsed[-1]s%{$reset_color%}"
    fi

    # clear time - show it only once
    set -A _elapsed
  fi

  # close parenthesis
  PS1+="%{$fg[$BRACES_COLOR]%}]%{$fg[white]%}: %{$reset_color%}% "
}

# https://github.com/robbyrussell/oh-my-zsh/pull/5262/commits/a51ad6f0f73e5dcfc36415bf1b0238aad1307bbe
shrink_path () {
  setopt localoptions
  setopt rc_quotes null_glob

  typeset -i lastfull=0
  typeset -i short=0
  typeset -i tilde=0
  typeset -i named=0

  if zstyle -t ':prompt:shrink_path' fish; then
    lastfull=1
    short=1
    tilde=1
  fi
  if zstyle -t ':prompt:shrink_path' nameddirs; then
    tilde=1
    named=1
  fi
  zstyle -t ':prompt:shrink_path' last && lastfull=1
  zstyle -t ':prompt:shrink_path' short && short=1
  zstyle -t ':prompt:shrink_path' tilde && tilde=1

  while [[ $1 == -* ]]; do
    case $1 in
      -f|--fish)
        lastfull=1
        short=1
        tilde=1
        ;;
      -h|--help)
        print 'Usage: shrink_path [-f -l -s -t] [directory]'
        print ' -f, --fish      fish-simulation, like -l -s -t'
        print ' -l, --last      Print the last directory''s full name'
        print ' -s, --short     Truncate directory names to the first character'
        print ' -t, --tilde     Substitute ~ for the home directory'
        print ' -T, --nameddirs Substitute named directories as well'
        print 'The long options can also be set via zstyle, like'
        print '  zstyle :prompt:shrink_path fish yes'
        return 0
        ;;
      -l|--last) lastfull=1 ;;
      -s|--short) short=1 ;;
      -t|--tilde) tilde=1 ;;
      -T|--nameddirs)
        tilde=1
        named=1
        ;;
    esac
    shift
  done

  typeset -a tree expn
  typeset result part dir=${1-$PWD}
  typeset -i i

  [[ -d $dir ]] || return 0

  if (( named )) {
    for part in ${(k)nameddirs}; {
      [[ $dir == ${nameddirs[$part]}(/*|) ]] && dir=${dir/${nameddirs[$part]}/\~$part}
    }
  }
  (( tilde )) && dir=${dir/$HOME/\~}
  tree=(${(s:/:)dir})

  (
    unfunction chpwd 2> /dev/null
    if [[ $tree[1] == \~* ]] {
      cd ${~tree[1]}
      result=$tree[1]
      shift tree
    } else {
    cd /
    }
    for dir in $tree; {
      if (( lastfull && $#tree == 1 )) {
        result+="/$tree"
        break
      }
    expn=(a b)
    part=''
    i=0
    until [[ (( ${#expn} == 1 )) || $dir = $expn || $i -gt 99 ]]  do
      (( i++ ))
      part+=$dir[$i]
      expn=($(echo ${part}*(-/)))
      (( short )) && break
    done
    result+="/$part"
    cd $dir
    shift tree
    }
    echo ${result:-/}
  )
}


if [[ ${PROMPT_SHOW_TIME} = true ]]; then
  preexec () {
    (( ${#_elapsed[@]} > 1000 )) && _elapsed=(${_elapsed[@]: -1000})
    _start=$SECONDS
  }

  precmd () {
    (( _start >= 0 )) && _elapsed+=($(( SECONDS-_start )))
    _start=-1
  }
fi

precmd_functions+=set_prompt

