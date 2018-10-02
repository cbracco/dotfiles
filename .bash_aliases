#!/bin/bash

#
# .bash_aliases
#
# Includes custom bash aliases that provide simpler ways to perform common tasks
# at the command line.
#

# Easier navigation: .., ..., ...., ....., ~ and -
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~" # `cd` is probably faster to type though
alias -- -="cd -"

# Make executable
alias ax="chmod a+x"

# Edit specific files
alias editp="$EDITOR ~/.profile"
alias editbp="$EDITOR ~/.bash_profile"
alias editbrc="$EDITOR ~/.bashrc"
alias editgc="$EDITOR ~/.gitconfig"
alias editirc="$EDITOR ~/.inputrc"
alias editvrc="$EDITOR ~/.vimrc"
alias edithosts="$EDITOR /etc/hosts"

# Copy the working directory path
alias cpwd='pwd|tr -d "\n"|pbcopy'

# Flush DNS
alias flushdns="sudo killall -HUP mDNSResponder"

# Share history between terminal sessions
alias he="history -a" # export history
alias hi="history -n" # import history

# Get your current public IP
alias ip="curl icanhazip.com"

# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
  colorflag="--color"
else # OS X `ls`
  colorflag="-G"
fi

# List all files colorized in long format
alias l="ls -lF ${colorflag}"

# List all files colorized in long format, including dot files
alias la="ls -laF ${colorflag}"

# List only directories
alias lsd="ls -lF ${colorflag} | grep --color=never '^d'"

# Always use color output for `ls`
alias ls="command ls ${colorflag}"

# Quick-Look preview files from the command line
alias ql="qlmanage -p &>/dev/null"

# Show/hide hidden files in Finder
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# Enable aliases to be sudo’ed
alias sudo='sudo '

# Remove git from a project
alias ungit="find . -name '.git' -exec rm -rf {} \;"

# Make a directory and change into it at the same time
md () { 
  mkdir -p "$@" && cd "$@";
}
