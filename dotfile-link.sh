#!/bin/sh

ln -s ~/dotfiles/.bashrc ~/.bashrc
ln -s ~/dotfiles/dot.zshrc ~/.zshrc
touch ~/.zshrc.local

ln -s ~/dotfiles/dot.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/dot.gitconfig ~/.gitconfig
ln -s ~/dotfiles/dot.gitignore.global ~/.gitignore.global

ln -s ~/dotfiles/dot.vimrc ~/.vimrc
ln -s ~/dotfiles/dot.vim ~/.vim
ln -s ~/dotfiles/dot.pryrc ~/.pryrc
ln -s ~/dotfiles/dot.eslintrc ~/.eslintrc
ln -s ~/dotfiles/dot.ideavimrc ~/.ideavimrc
ln -s ~/dotfiles/dot.tigrc ~/.tigrc
