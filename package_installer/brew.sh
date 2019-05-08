#!/bin/bash -eu

# Make sure using latest Homebrew
brew update

brew install ant
brew install bash-completion
brew install curl
brew install direnv
brew install git
brew install jsonlint
brew install openssl
brew install p7zip
brew install peco
brew install rbenv
brew install readline
brew install tmux
brew install tree
brew install yarn
brew install jq
brew install lua

case "${OSTYPE}" in
darwin*)
  # only mac
  brew install reattach-to-user-namespace
  brew install vim

  brew install caskroom/cask/dropbox
  brew install caskroom/cask/skitch
  brew install caskroom/cask/slack
  brew install caskroom/cask/limechat
  brew install caskroom/cask/licecap
  brew install caskroom/cask/sequel-pro
  brew install caskroom/cask/discord
  ;;
linux*)
  ;;
esac

# js lint tools
yarn global add prettier
yarn global add eslint

#remove outdated versions
brew cleanup
