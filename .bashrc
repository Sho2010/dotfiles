export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="/Applications/Sublime Text.app/Contents/SharedSupport/bin:$PATH"
eval "$(rbenv init -)"

. ~/dotfiles/config
. ~/dotfiles/aliases
. ~/dotfiles/completions

if [ -f "~/.bashrc.local" ]; then
  . "~/.bashrc.local"
fi
