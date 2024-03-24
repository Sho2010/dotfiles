#!/bin/sh

# for WSL2
# wget https://packages.microsoft.com/config/debian/10/packages-microsoft-prod.deb -O packages-microsoft-prod.deb dpkg -i packages-microsoft-prod.deb

sudo apt-get install -y \
  build-essential \
  curl \
  git-core \
  libmysqlclient-dev \
  libreadline-dev \
  libreadline5 \
  libssl-dev \
  libxml2-dev \
  libxslt-dev \
  mysql-client \
  nkf \
  openssl \
  tmux \
  vim-gtk \
  wget \
  xclip \
  xsel \
  zsh \
;
# for chrome
sudo apt-get install libappindicator1 fonts-liberation

# opa
curl -L -o opa https://openpolicyagent.org/downloads/latest/opa_linux_amd64
