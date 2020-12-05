# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh


# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git ruby bundler brew zsh-completions)
# fpath=(/usr/local/share/zsh-completions $fpath)

# User configuration

# Go
export PATH="/Users/Sho2010/.rbenv/shims:/Users/Sho2010/.rbenv/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export GOPATH=$HOME/go
export PATH="$GOPATH/bin:$PATH"
export GO15VENDOREXPERIMENT=1

# export MANPATH="/usr/local/man:$MANPATH"
source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=ja_JP.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# 補完設定
HISTFILE=$HOME/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

# シェルのプロセスごとに履歴を共有
setopt share_history

# 余分なスペースを削除してヒストリに記録する
setopt hist_reduce_blanks

# ヒストリにhistoryコマンドを記録しない
setopt hist_no_store

# ヒストリを呼び出してから実行する間に一旦編集できる状態になる
# setopt hist_verify

# 直前と同じコマンドラインはヒストリに追加しない
setopt hist_ignore_dups

# 重複したヒストリは追加しない
setopt hist_ignore_all_dups

# PROMPT
SUSHI=$'\U1F363 '
HUM=$'\U1F439  '
SKULL=$'\U1F480  '

PROMPT="${PROMPT} ${SUSHI} "
if [ "${PRODUCTION}" = "true" ] ; then
  PROMPT="${PROMPT}${SKULL} "
fi

# if [ -e /usr/local/share/zsh-completions ]; then
#   fpath=(/usr/local/share/zsh-completions $fpath)
# fi
autoload -U compinit && compinit

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
. ~/dotfiles/config
. ~/dotfiles/aliases
. ~/dotfiles/dot.zsh-aliases
. ~/dotfiles/net_tools_deprecated.sh
. ~/dotfiles/aws.sh
. ~/.zshrc.local

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/sho.naito/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/sho.naito/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/sho.naito/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/sho.naito/google-cloud-sdk/completion.zsh.inc'; fi

export FZF_DEFAULT_OPTS='--cycle'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
