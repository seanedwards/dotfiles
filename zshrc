# Path to your oh-my-zsh installation.
export PLATFORM=`uname`
export ZTVPDIR=`cat ${HOME}/.dotfilesdir`
export ZPLUG_HOME="${ZTVPDIR}/zsh/zplug"

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
DEFAULT_USER=`whoami`

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

source "${ZPLUG_HOME}/init.zsh"

zplug "robbyrussell/oh-my-zsh", use:"lib/*", nice:-1
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting", nice:10
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/mercurial", from:oh-my-zsh
zplug "plugins/ruby", from:oh-my-zsh
zplug "plugins/rbenv", from:oh-my-zsh
zplug "plugins/bundler", from:oh-my-zsh
zplug "plugins/osx", from:oh-my-zsh
zplug "plugins/tmux", from:oh-my-zsh
zplug "plugins/wd", from:oh-my-zsh

zplug "lib/theme-and-appearance", from:oh-my-zsh
zplug "themes/af-magic", from:oh-my-zsh

# Install plugins if there are plugins that have not been installed
if ! zplug check; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load

fpath=(/usr/local/share/zsh-completions $fpath)

#source "$ZSH/oh-my-zsh.sh"

RPS1='$(vi_mode_prompt_info)'
# source "$ZTVPDIR/tmuxinator.zsh"

# hg settings
ZSH_THEME_HG_PROMPT_PREFIX="$FG[075](hg:"
ZSH_THEME_HG_PROMPT_SUFFIX="$FG[075])%{$reset_color%}"
ZSH_THEME_HG_PROMPT_DIRTY="$FG[226]*%{$reset_color%}"
ZSH_THEME_HG_PROMPT_CLEAN=""

# git settings
ZSH_THEME_GIT_PROMPT_PREFIX="$FG[075](git:"
ZSH_THEME_GIT_PROMPT_SUFFIX="$FG[075])%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="$FG[226]*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

function preexec() {
  timer=${timer:-$SECONDS}
}

function precmd() {
  if [ $timer ]; then
    timer_show=$(($SECONDS - $timer))
    export LAST_CMD_TIME=$(($SECONDS - $timer))
    unset timer
  fi
}

function aws_prompt_info() {
  case $AWS_DEFAULT_PROFILE in
  "")
    echo NONE
    ;;
  *dev*)
    echo %F{green}${AWS_DEFAULT_PROFILE}%f
    ;;
  *prod*)
    echo %F{red}${AWS_DEFAULT_PROFILE}%f
    ;;
  *)
    echo %F{yellow}${AWS_DEFAULT_PROFILE}%f
    ;;
  esac
}


function render_prompt() {
  LAST_CMD_STATUS="exit ${?} in ${LAST_CMD_TIME}s"
cat << EOM
%U${(l:COLUMNS:: :)LAST_CMD_STATUS}%u
$FG[240][ ruby: $(ruby_prompt_info) | aws: $(aws_prompt_info) $FG[240]]
$FG[240]$FG[032]%~ $(git_prompt_info)$(hg_prompt_info)$FG[105]$ %{$reset_color%}
EOM
}
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=240'

PROMPT='$(render_prompt)'
RPROMPT="${return_code}"

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

PATH="$ZTVPDIR/bin:~/.bin:/usr/local/bin:/usr/local/sbin:/opt/local/bin:/usr/sbin:/sbin:$PATH"

unset AWS_DEFAULT_PROFILE
export AWS_REGION=us-east-1
export HOMEBREW_GITHUB_API_TOKEN="83786bd0adf6fdc319c1144b9225d5de895d9ae8"

[ -f ~/.travis/travis.sh ] && source ~/.travis/travis.sh
[ -f ~/.zshrc.local ] && source ~/.zshrc.local
