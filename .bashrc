#!/bin/bash

#
# .bashrc
#
# Includes anything you want at an interactive command line, such as a custom
# command prompt, EDITOR variable, bash aliases, etc.
#

# Load nvm
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# Load rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Source virtualenvwrapper (if it exists)
if [ -f /usr/local/bin/virtualenvwrapper.sh ]
then
  source /usr/local/bin/virtualenvwrapper.sh
fi

# Source bash aliases (if it exists)
if [ -f ~/.bash_aliases ]
then
  source ~/.bash_aliases
fi

# Execute bash_completion (if it exists)
if [ -f $(brew --prefix)/share/bash-completion/bash_completion ]; then
    . $(brew --prefix)/share/bash-completion/bash_completion
fi

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
