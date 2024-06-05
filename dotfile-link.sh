#!/bin/sh


if [ -e ~/.bashrc ]; then
  echo ".bashrc exists. backup to .bashrc.bak"
  mv ~/.bashrc ~/.bashrc.bak
fi
ln -s ~/dotfiles/.bashrc ~/.bashrc

if [ -e ~/.zshrc ]; then
  echo ".zshrc exists. backup to .zshrc.bak"
  mv ~/.zshrc ~/.zshrc.bak
fi
ln -s ~/dotfiles/dot.zshrc ~/.zshrc

touch ~/.zshrc.local

ln -s ~/dotfiles/dot.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/dot.gitconfig ~/.gitconfig
ln -s ~/dotfiles/dot.gitignore.global ~/.gitignore.global

ln -s ~/dotfiles/dot.pryrc ~/.pryrc
ln -s ~/dotfiles/dot.eslintrc ~/.eslintrc
ln -s ~/dotfiles/dot.ideavimrc ~/.ideavimrc
ln -s ~/dotfiles/dot.tigrc ~/.tigrc

# mkdir -p ~/.config/dein
# ln -s ~/dotfiles/dein/go_lazy.toml ~/.config/dein/go_lazy.toml
# ln -s ~/dotfiles/dein/lazy.toml    ~/.config/dein/lazy.toml
# ln -s ~/dotfiles/dein/dein.toml    ~/.config/dein/dein.toml

# Setup neovim
ln -s ~/dotfiles/dot.vim ~/.config/nvim

ln -s ~/dotfiles/wezterm ~/.config/wezterm
