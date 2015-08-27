#!/bin/sh

ln -s ~/dotfiles/.bashrc ~/.bashrc
ln -s ~/dotfiles/dot.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/dot.gitconfig ~/.gitconfig
ln -s ~/dotfiles/dot.gitignore.global ~/.gitignore.global
ln -s ~/dotfiles/.vimrc ~/.vimrc

if [ ! -d "~/.vim" ] ; then 
  mkdir "~/.vim"
fi
ln -s ~/dotfiles/vimrcs ~/.vim/vimrcs
