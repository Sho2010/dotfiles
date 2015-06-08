#!/bin/sh

ln -s ~/dotfiles/dot.gitconfig ~/.gitconfig
ln -s ~/dotfiles/dot.gitignore.global ~/.gitignore.global

case "${OSTYPE}" in
darwin*)
  cp ~/dotfiles/dot.gitconfig_mac  ~/.gitconfig.local 
  ;;
linux*)
  ;;
esac

