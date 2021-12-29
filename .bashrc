#!/bin/bash

#
# .bashrc
#
# Includes anything you want at an interactive command line, such as a custom
# command prompt, EDITOR variable, bash aliases, etc.
#

# Load rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Initialize pyenv
if pyenv which virtualenvwrapper_lazy.sh >/dev/null 2>&1; then
    . "$(pyenv which virtualenvwrapper_lazy.sh)"
fi
eval "$(pyenv init -)"

# Initialize virtualenvwrapper
pyenv virtualenvwrapper_lazy

# Source bash aliases (if it exists)
if [ -f ~/.bash_aliases ]
then
  source ~/.bash_aliases
fi

# Execute bash_completion (if it exists)
[ -f $(brew --prefix)/etc/bash_completion ] && . $(brew --prefix)/etc/bash_completion

# Set the default editor
export EDITOR="vim"

# Increase Bash history size. Allow 32³ entries; the default is 500.
export HISTSIZE='32768';
export HISTFILESIZE="${HISTSIZE}";

# Omit duplicates and commands that begin with a space from history.
# Avoid duplicate entries
export HISTCONTROL="erasedups:ignoreboth"

# Don't record some commands
export HISTIGNORE="&:[ ]*:exit:ls:bg:fg:history:clear"

# Useful timestamp format
export HISTTIMEFORMAT='%F %T '

# A more useful terminal prompt
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWSTASHSTATE=true
export PROMPT_DIRTRIM=3

# Get current branch in git repo
function parse_git_branch() {
  BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
  if [ ! "${BRANCH}" == "" ]
  then
    STAT=`parse_git_dirty`
    echo "[${BRANCH}${STAT}]"
  else
    echo ""
  fi
}

# Get current status of git branch
function parse_git_dirty {
  status=`git status 2>&1 | tee`
  dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
  untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
  ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
  newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
  renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
  deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
  bits=''
  if [ "${renamed}" == "0" ]; then
    bits=">${bits}"
  fi
  if [ "${ahead}" == "0" ]; then
    bits="*${bits}"
  fi
  if [ "${newfile}" == "0" ]; then
    bits="+${bits}"
  fi
  if [ "${untracked}" == "0" ]; then
    bits="?${bits}"
  fi
  if [ "${deleted}" == "0" ]; then
    bits="x${bits}"
  fi
  if [ "${dirty}" == "0" ]; then
    bits="!${bits}"
  fi
  if [ ! "${bits}" == "" ]; then
    echo " ${bits}"
  else
    echo ""
  fi
}

# Set prompt format
export PS1="\[\e[1;35m\]\u\[\e[m\] at \[\e[1;34m\]\h\[\e[m\] in \[\e[1;32m\]\w\[\e[m\] on \[\e[1;33m\]\`parse_git_branch\`\[\e[m\]\n$ "

# Initialize nvm and nvm bash_completion
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
