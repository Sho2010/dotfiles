#!/bin/bash

SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)

# Create XDG Base Directory
mkdir -p ~/.config

# Install Homebrew if not installed
if ! command -v brew > /dev/null 2>&1; then
  echo "Install Homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

case "${OSTYPE}" in
  darwin*)
    cp ~/dotfiles/dot.gitconfig_mac ~/.gitconfig.local
    ;;
  linux*)
    if [ -f /etc/os-release ]; then
      source /etc/os-release
      case ${ID} in
        rhel|centos|fedora)
          echo "Install yum packages"
          echo "Nothing to do yum."
          ;;
        debian|ubuntu)
          echo "Install apt packages"
          "${SCRIPT_DIR}/package_installer/apt-get.sh"
          ;;
        *)
          echo "Unsupported OS: ${ID}"
          ;;
      esac
    fi
    ;;
esac

~/dotfiles/dotfile-link.sh

