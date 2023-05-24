#!/bin/bash -eu

SCRIPT_DIR=$(cd $(dirname $0);pwd)

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
brew install jsonnet
brew install lua
brew install openssl
brew install p7zip
brew install peco
brew install rbenv
brew install readline
brew install terraform
brew install tflint
brew install tfsec
brew install tig
brew install tmux
brew install tree
brew install watch
brew install yarn
brew install ghq
brew install shellcheck
brew install rg
brew install ag
brew install fzf
brew install ctags

# ついでにgoの開発ツール入れちゃう
$SCRIPT_DIR/go.sh

# k8s
brew install kustomize
brew install kubernetes-helm

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

  brew install homebrew/cask/dropbox
  brew install homebrew/cask/skitch
  brew install homebrew/cask/slack
  brew install homebrew/cask/licecap
  brew install homebrew/cask/sequel-pro
  brew install homebrew/cask/discord
  brew install homebrew/cask/charles

  # yubikey tools
  brew install yubico-piv-tool # piv CLI
  brew install ykman           # manage CLI e.g. GPG key management

  # Use GNU instead of BSD utilities
  brew install coreutils
  brew install gnu-sed
  brew install gawk
  ;;
linux*)
  ;;
esac

# js lint tools
yarn global add prettier
yarn global add eslint

# conftest
brew tap instrumenta/instrumenta
brew install conftest

#remove outdated versions
brew cleanup
