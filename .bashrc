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

# Run virtualenvwrapper (if present)
if [ -f /usr/local/bin/virtualenvwrapper.sh ]
then
  source /usr/local/bin/virtualenvwrapper.sh
fi

# Include bash aliases (if present)
if [ -f ~/.bash_aliases ]
then
  source ~/.bash_aliases
fi
