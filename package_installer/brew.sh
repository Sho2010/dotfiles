#!/bin/bash -eu

# Make sure using latest Homebrew
brew update

brew install ant
brew install bash-completion
brew install curl
brew install direnv
brew install git
brew install gnu-sed
brew install go
brew install hub
brew install jq
brew install jsonlint
brew install lua
brew install openssl
brew install p7zip
brew install peco
brew install rbenv
brew install readline
brew install terraform
brew install tig
brew install tmux
brew install tree
brew install watch
brew install yarn
brew install ghq

# k8s
brew install kustomize
brew install kubernetes-helm
go get -u github.com/kubernetes-sigs/aws-iam-authenticator/cmd/aws-iam-authenticator

# optional
brew install kubectx
brew install stern
brew install kube-ps1

# for nvim
brew install nvim
brew install python@3
pip3 install neovim

case "${OSTYPE}" in
darwin*)
  # only mac
  brew install reattach-to-user-namespace

  brew install caskroom/cask/dropbox
  brew install caskroom/cask/skitch
  brew install caskroom/cask/slack
  brew install caskroom/cask/licecap
  brew install caskroom/cask/sequel-pro
  brew install caskroom/cask/discord
  brew install caskroom/cask/charles

  # yubikey tools
  brew install yubico-piv-tool # piv CLI
  brew install ykman           # manage CLI e.g. GPG key management
  ;;
linux*)
  ;;
esac

# js lint tools
yarn global add prettier
yarn global add eslint

#remove outdated versions
brew cleanup
