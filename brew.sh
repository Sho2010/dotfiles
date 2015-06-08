#!/bin/bash -eu

# Make sure using latest Homebrew
brew update

brew tap homebrew/versions
brew tap homebrew/binary
brew tap caskroom/versions

brew install caskroom/cask/brew-cask
brew install git
brew install wget
brew install curl
brew install openssl
brew install mysql
brew install ant
brew install bash-completion


brew cask install skype
brew cask install dropbox
brew cask install skitch
brew cask install virtualbox
brew cask install vagrant
brew cask install boot2docker
brew cask install slack

#remove outdated versions
brew cleanup
brew cask cleanup
