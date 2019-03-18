#!/bin/sh
~/dotfiles/dotfile-link.sh

case "${OSTYPE}" in
darwin*)
  cp ~/dotfiles/dot.gitconfig_mac  ~/.gitconfig.local
  ;;
linux*)
  ;;
esac

