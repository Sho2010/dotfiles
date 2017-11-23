#!/bin/bash -eu

# Make sure using latest Homebrew
brew update

brew tap homebrew/versions
brew tap homebrew/binary
brew tap caskroom/versions
brew tap caskroom/cask

brew install git
brew install wget
brew install curl
brew install openssl
brew install mysql
brew install ant
brew install bash-completion
brew install readline
brew install rbenv
brew install ccache
brew install tmux
brew install reattach-to-user-namespace
brew install peco
brew install direnv
brew install redis
brew install p7zip

brew install caskroom/cask/dropbox
brew install caskroom/cask/skitch
brew install caskroom/cask/virtualbox
brew install caskroom/cask/vagrant
brew install caskroom/cask/slack
brew install caskroom/cask/limechat
brew install caskroom/cask/licecap
brew install caskroom/cask/sequel-pro
brew install caskroom/cask/discord

#remove outdated versions
brew cleanup
