################################################################################
# Cory's .bashrc
################################################################################

# Shell variables ##############################################################
export PAGER=less
export EDITOR=vim
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export PATH=$PATH:$HOME/.bin

# Color variables ##############################################################
## Regular
txtblk='\e[0;30m' # Black
txtred='\e[0;31m' # Red
txtgrn='\e[0;32m' # Green
txtylw='\e[0;33m' # Yellow
txtblu='\e[0;34m' # Blue
txtpur='\e[0;35m' # Purple
txtcyn='\e[0;36m' # Cyan
txtwht='\e[0;37m' # White
## Bold
bldblk='\e[1;30m' # Black
bldred='\e[1;31m' # Red
bldgrn='\e[1;32m' # Green
bldylw='\e[1;33m' # Yellow
bldblu='\e[1;34m' # Blue
bldpur='\e[1;35m' # Purple
bldcyn='\e[1;36m' # Cyan
bldwht='\e[1;37m' # White
## Underlined
undblk='\e[4;30m' # Black
undred='\e[4;31m' # Red
undgrn='\e[4;32m' # Green
undylw='\e[4;33m' # Yellow
undblu='\e[4;34m' # Blue
undpur='\e[4;35m' # Purple
undcyn='\e[4;36m' # Cyan
undwht='\e[4;37m' # White
## Background
bakblk='\e[40m' # Black
bakred='\e[41m' # Red
bakgrn='\e[42m' # Green
bakylw='\e[43m' # Yellow
bakblu='\e[44m' # Blue
bakpur='\e[45m' # Purple
bakcyn='\e[46m' # Cyan
bakwht='\e[47m' # White
## Reset
txtrst='\e[0m'    # Text Reset

# Attach .bash_aliases #########################################################
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Interactive mode check #######################################################
case $- in
    *i*) ;;
      *) return;;
esac

# Set PS1 ######################################################################
## Functions
### Parse git branch
function git-branch-name {
  git symbolic-ref HEAD 2>/dev/null | cut -d"/" -f 3
}

### Check if repo is clean/dirty
function git-dirty {
  if [[ $(git status 2>/dev/null | tail -n1) != "nothing to commit, working directory clean" ]]; then
    echo "$undred*"
  else
    echo "$undgrn"
  fi
}

### If in a repo, print to PS1
function git-branch-prompt {
  local branch=`git-branch-name`
  if [ $branch ]; then printf "[$(git-dirty)%s$txtrst] " $branch; fi
}

## If root print red, else normal
if [ $(id -u) -eq 0 ]; then
  export PS1="\$(git-branch-prompt)$txtred#$txtrst "
else
  export PS1="\$(git-branch-prompt)$ "
  export SUDO_PS1="$txtred#$txtrst "
fi

# History Settings #############################################################
## Ignore duplicates
HISTCONTROL=ignoreboth
HISTIGNORE="ls:pwd"

## Append to history file, don't overwrite
shopt -s histappend

## Set max number of history lines, and filesize
HISTSIZE=1000
HISTFILESIZE=2000

# Check window size after each command #########################################
shopt -s checkwinsize