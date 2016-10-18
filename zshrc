# Path to your oh-my-zsh installation.
export PLATFORM=`uname`
export ZTVPDIR="${HOME}/.dotfiles"
export ZSH="$ZTVPDIR/zsh/oh-my-zsh"

read -r -d '' GOAT <<EOF
(_(
/_/'_____/)
"  |      |
   |""""""|
EOF

if [[ "$PLATFORM" -eq "Darwin" ]]
then
  PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
  export M3_HOME="/usr/local"
  export ANDROID_HOME="/usr/local/opt/android-sdk"
  export ANDROID_NDK_HOME="/usr/local/opt/android-ndk"

  $(boot2docker shellinit 2> /dev/null)

elif [[ "$PLATFORM" -eq "Linux" ]]
then
  PLUGINS=
fi

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="af-magic"
DEFAULT_USER=`whoami`
ZSH_THEME="af-magic"
ZSH_CUSTOM="$ZSH/../custom"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Updates will be handled by dotfiles repo
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

if [[ -o login ]]; then
  ZSH_TMUX_AUTOSTART="true"
fi

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

plugins=(git mercurial ruby rbenv bundler osx tmux wd)
fpath=(/usr/local/share/zsh-completions $fpath)

source "$ZSH/oh-my-zsh.sh"
source "$ZTVPDIR/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh"
bindkey '^ ' autosuggest-accept

RPS1='$(vi_mode_prompt_info)'
# source "$ZTVPDIR/tmuxinator.zsh"

# hg settings
ZSH_THEME_HG_PROMPT_PREFIX="$FG[075](hg branch:"
ZSH_THEME_HG_PROMPT_SUFFIX="$FG[075])%{$reset_color%}"
ZSH_THEME_HG_PROMPT_DIRTY="$my_orange*%{$reset_color%}"
ZSH_THEME_HG_PROMPT_CLEAN=""

# git settings
ZSH_THEME_GIT_PROMPT_PREFIX="$FG[075](git branch:"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="$my_orange*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="$FG[075])%{$reset_color%}"

# primary prompt
PROMPT='$FG[237]------------------------------------------------------------%{$reset_color%}
$FG[032]%~\
$(git_prompt_info)$(hg_prompt_info) \
$FG[105]%(!.#.»)%{$reset_color%} '

RPROMPT='<ruby:$(ruby_prompt_info)> <aws:$AWS_RPROMPT>'
PROMPT2='%{$fg[red]%}\ %{$reset_color%}'

export MANPATH="/usr/local/man:$MANPATH"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

source "$ZTVPDIR/aliases"
if [ -e ~/.aliases ]; then
  source ~/.aliases
fi

PATH="$ZTVPDIR/bin:~/bin:/usr/local/bin:/usr/local/sbin:/opt/local/bin:/usr/sbin:/sbin:$PATH"

goat

unset AWS_DEFAULT_PROFILE
export AWS_REGION=us-east-1

[ -f ~/.travis/travis.sh ] && source ~/.travis/travis.sh
[ -f ~/.zshrc.local ] && source ~/.zshrc.local
