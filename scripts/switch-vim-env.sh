#!/bin/bash

# Neovimの設定ディレクトリ
NVIM_CONFIG_DIR="$HOME/.config/nvim"

# 切り替えるディレクトリ
DOTVIM_DIR="$HOME/dotfiles/dot.vim"
NVIM_DIR="$HOME/dotfiles/nvim"

# 現在のシンボリックリンクを確認
CURRENT_LINK=$(readlink "$NVIM_CONFIG_DIR")

# シンボリックリンクを切り替え
if [ "$CURRENT_LINK" = "$DOTVIM_DIR" ]; then
    # dot.vimからnvimに切り替え
    ln -sfn "$NVIM_DIR" "$NVIM_CONFIG_DIR"
    echo "Switched to $NVIM_DIR"
else
    # nvimからdot.vimに切り替え
    ln -sfn "$DOTVIM_DIR" "$NVIM_CONFIG_DIR"
    echo "Switched to $DOTVIM_DIR"
fi
