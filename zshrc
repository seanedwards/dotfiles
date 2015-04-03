# Path to your oh-my-zsh installation.
export PLATFORM=`uname`
ZTVPDIR="zsh-tmux-vim-pry"
export ZSH="$ZTVPDIR/zsh/oh-my-zsh"

PATH="~/bin:/usr/local/bin:/usr/local/sbin:/opt/local/bin:/usr/sbin:/sbin:$PATH"

if [[ "$PLATFORM" -eq "Darwin" ]]
then
  PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
  export M3_HOME="/usr/local"
  export ANDROID_HOME="/usr/local/opt/android-sdk"
  export ANDROID_NDK_HOME="/usr/local/opt/android-ndk"
  export AWS_DEFAULT_PROFILE="sandbox"

  #bindkey '\e[3~'         delete-char             # delete
  bindkey '^[[1~'         beginning-of-line       # home
  bindkey '^[[4~'         end-of-line             # end
  #bindkey '\e[1;5D'       backward-word           # ctrl-left
  #bindkey '\e[1;5C'       forward-word            # ctrl-right


  #bindkey '^@'            history-incremental-search-backward     # ctrl-space
  #bindkey '^[ '           history-beginning-search-backward       # ctrl-alt-space

  export DOCKER_HOST="tcp://`boot2docker ip 2> /dev/null`:2375"
  
elif [[ "$PLATFORM" -eq "Linux" ]]
then
  PLUGINS= 
fi

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="af-magic"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Updates will be handled by dotfiles repo
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

plugins=(git ruby rvm aws bundler osx brew tmux)

source "$ZSH/oh-my-zsh.sh"
# source "$ZTVPDIR/tmuxinator.zsh"

RPROMPT=''

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

if [ -e ~/.zshrc-local ]; then
  source ~/.zshrc-local
fi

source "$ZTVPDIR/aliases"
if [ -e ~/.aliases ]; then
  source ~/.aliases
fi

cls


# added by travis gem
[ -f /Users/sedwards/.travis/travis.sh ] && source /Users/sedwards/.travis/travis.sh

# If not running interactively, do not do anything
[[ $- != *i* ]] && return
[[ -z "$TMUX" ]] && exec tmux

