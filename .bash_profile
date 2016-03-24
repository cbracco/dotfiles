#!/bin/bash

#
# .bash_profile
#
# Source `~/.profile` and `~/.bashrc` dotfiles (in that order). Nothing else
# should go in this dotfile.
#

if [ -f ~/.profile ]; then
  source ~/.profile
fi

if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi
