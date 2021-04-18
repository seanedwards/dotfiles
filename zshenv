#!/usr/bin/env zsh

export ZTVPDIR="$HOME/dotfiles"
export PATH="$HOME/.cargo/bin:$HOME/dotfiles/bin:$HOME/.bin:$HOME/.local/bin:/usr/local/bin:/usr/local/sbin:/opt/local/bin:/usr/sbin:/sbin:$PATH"
export MANPATH="/usr/local/man:$MANPATH"

unset AWS_DEFAULT_PROFILE
export AWS_REGION=us-east-1

