#!/bin/bash -eu

# Make sure using latest Homebrew
brew update

brew install git
brew install wget
brew install curl
brew install openssl
brew install mysql
brew install ant


#remove outdated versions
brew cleanup
brew cask cleanup
