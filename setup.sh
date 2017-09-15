#!/bin/sh
~/dotfiles/dotfile-link.sh

case "${OSTYPE}" in
darwin*)
  cp ~/dotfiles/dot.gitconfig_mac  ~/.gitconfig.local
  VIMPROC_MAKE="make_mac.mak"
  ;;
linux*)
  VIMPROC_MAKE="make_unix.mak"
  ;;
esac

