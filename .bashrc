[ -r /usr/local/etc/profile.d/bash_completion.sh ] && . /usr/local/etc/profile.d/bash_completion.sh

xhost +local:root > /dev/null 2>&1

complete -cf sudo

shopt -s cdspell         # fix typos
shopt -s checkwinsize    # update LINES and COLUMNS
shopt -s cmdhist         # save multiple-line commands as one history entry
shopt -s dotglob         # include dotfiles in pathname expansion
shopt -s expand_aliases  # expand aliases
shopt -s extglob         # extended pattern matching in pathname expansion
shopt -s histappend      # append to history
shopt -s hostcomplete    # autocomplete hostnames
shopt -s nocaseglob      # case-insensitive in pathname expansion

export LC_ALL=en_US.utf-8
export LANG=en_US.utf-8

export PATH=/usr/local/opt/coreutils/libexec/gnubin:$PATH
export MANPATH=/usr/local/opt/coreutils/libexec/gnuman:$MANPATH

export HISTSIZE=10000
export HISTFILESIZE=${HISTSIZE}
export HISTTIMEFORMAT="%d.%m.%y %T "
export HISTCONTROL=ignoreboth:erasedups
export PATH=$PATH:$HOME/.bin
export PATH=/usr/local/sbin:$PATH
export TERM=xterm-256color
export EDITOR=vim
export PAGER=less

export LESS_TERMCAP_mb=$'\E[01;31m'      # begin blinking
export LESS_TERMCAP_md=$'\E[01;31m'      # begin bold
export LESS_TERMCAP_me=$'\E[0m'          # end mode
export LESS_TERMCAP_se=$'\E[0m'          # end standout-mode
export LESS_TERMCAP_so=$'\E[01;44;33m'   # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'          # end underline
export LESS_TERMCAP_us=$'\E[01;32m'      # begin underline

export BASH_SILENCE_DEPRECATION_WARNING=1

export PROMPT_COMMAND='history -a' # flush commands to bash history immediately

alias ls='ls --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias ll='ls -l'
alias la='ll -a'
alias lah='la -h'
alias lart='la -rt'
alias grep='grep --color=always -d skip'
alias rgrep='grep -r'
alias egrep='grep -E'
alias hgrep='history | grep'
alias portgrep='sudo lsof -i -n -P | grep TCP | grep'
alias cp='cp -i'                          # confirm before overwriting something
alias df='df -h'                          # human-readable sizes
alias du='du -h'                          # human-readable sizes, use du -s * to summarize by directory
alias free='free -m'                      # show sizes in MB
alias less='less -R'
alias ..='cd ..'
alias cd..='cd ..'
alias vi='vim'
alias tcpflow-http='sudo tcpflow -C port 80 -i enp0s25 -e'
alias diff='colordiff'
alias color='pygmentize -g'
alias json='python -m json.tool'
alias xml='xmllint --format -'
alias nl='nl -ba -w3 -s" "'
alias reload='source ~/.bashrc'
alias bashrc='vim ~/.bashrc'
alias bashrcl='vim ~/.bashrc.local'
alias vimrc='vim ~/.vim/vimrc'
alias g='git'

function pgrep () {
  command pgrep $1 | awk '{print $1}' | xargs ps -p
}

function b64 () {
  echo -n "$@" | base64
}

function b64d () {
  echo -n "$@" | base64 -d
  echo
}

# calc - math calculation
function calc () {
    bc -l <<< "$@"
}

# ff - find file
function ff () {
  find . -name "$1"
}

# ffv - find file and vim edit
function ffv () {
  vim -p $(ff $1);
}

function genpass () {
  echo $(< /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c$1; echo)
}

# ex - archive extractor
function ex () {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# cd - replace cd with pushd/popd
function cd () {
  if (("$#" > 0)); then
    if [ "$1" == "-" ]; then
      popd > /dev/null
    elif [ "$1" == "-P" ]; then
      pushd $(readlink -f "${@:2}") > /dev/null
    else
      pushd "$@" > /dev/null
    fi
  else
    pushd $HOME > /dev/null
  fi
  ls
}

# mkdir - replace mkdir with mkdir && cd
function mkdir () {
  command mkdir -p "$@" && cd "$@";
}

. $HOME/.bin/git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1

export DIRENV_LOG_FORMAT=
eval "$(direnv hook bash)"

export JAVA_HOME=$(/usr/libexec/java_home)/jre

# Reset
Color_Off="\[\033[0m\]"       # Text Reset

# Regular Colors
Black="\[\033[0;30m\]"        # Black
Red="\[\033[0;31m\]"          # Red
Green="\[\033[0;32m\]"        # Green
Yellow="\[\033[0;33m\]"       # Yellow
Blue="\[\033[0;34m\]"         # Blue
Purple="\[\033[0;35m\]"       # Purple
Cyan="\[\033[0;36m\]"         # Cyan
White="\[\033[0;37m\]"        # White

# Bold
BBlack="\[\033[1;30m\]"       # Black
BRed="\[\033[1;31m\]"         # Red
BGreen="\[\033[1;32m\]"       # Green
BYellow="\[\033[1;33m\]"      # Yellow
BBlue="\[\033[1;34m\]"        # Blue
BPurple="\[\033[1;35m\]"      # Purple
BCyan="\[\033[1;36m\]"        # Cyan
BWhite="\[\033[1;37m\]"       # White

# Underline
UBlack="\[\033[4;30m\]"       # Black
URed="\[\033[4;31m\]"         # Red
UGreen="\[\033[4;32m\]"       # Green
UYellow="\[\033[4;33m\]"      # Yellow
UBlue="\[\033[4;34m\]"        # Blue
UPurple="\[\033[4;35m\]"      # Purple
UCyan="\[\033[4;36m\]"        # Cyan
UWhite="\[\033[4;37m\]"       # White

# Background
On_Black="\[\033[40m\]"       # Black
On_Red="\[\033[41m\]"         # Red
On_Green="\[\033[42m\]"       # Green
On_Yellow="\[\033[43m\]"      # Yellow
On_Blue="\[\033[44m\]"        # Blue
On_Purple="\[\033[45m\]"      # Purple
On_Cyan="\[\033[46m\]"        # Cyan
On_White="\[\033[47m\]"       # White

# High Intensty
IBlack="\[\033[0;90m\]"       # Black
IRed="\[\033[0;91m\]"         # Red
IGreen="\[\033[0;92m\]"       # Green
IYellow="\[\033[0;93m\]"      # Yellow
IBlue="\[\033[0;94m\]"        # Blue
IPurple="\[\033[0;95m\]"      # Purple
ICyan="\[\033[0;96m\]"        # Cyan
IWhite="\[\033[0;97m\]"       # White

# Bold High Intensty
BIBlack="\[\033[1;90m\]"      # Black
BIRed="\[\033[1;91m\]"        # Red
BIGreen="\[\033[1;92m\]"      # Green
BIYellow="\[\033[1;93m\]"     # Yellow
BIBlue="\[\033[1;94m\]"       # Blue
BIPurple="\[\033[1;95m\]"     # Purple
BICyan="\[\033[1;96m\]"       # Cyan
BIWhite="\[\033[1;97m\]"      # White

# High Intensty backgrounds
On_IBlack="\[\033[0;100m\]"   # Black
On_IRed="\[\033[0;101m\]"     # Red
On_IGreen="\[\033[0;102m\]"   # Green
On_IYellow="\[\033[0;103m\]"  # Yellow
On_IBlue="\[\033[0;104m\]"    # Blue
On_IPurple="\[\033[10;95m\]"  # Purple
On_ICyan="\[\033[0;106m\]"    # Cyan
On_IWhite="\[\033[0;107m\]"   # White

# Various variables you might want for your PS1 prompt instead
Time12h="\T"
Time12a="\@"
PathShort="\w"
PathFull="\W"
NewLine="\n"
Jobs="\j"
User="\u"
Hostname="\h"

# prompt
PS1="$BGreen$User@$Hostname $BBlue$PathShort$BRed"'$(__git_ps1 " [%s]")'"$Color_Off\$ "

[ -f $HOME/.bashrc.local ] && . $HOME/.bashrc.local
