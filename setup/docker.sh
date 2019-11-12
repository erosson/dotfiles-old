#!/bin/sh -eu
# 2019/11/11: https://docs.docker.com/install/linux/docker-ce/ubuntu/
if ! [ -x "$(command -v docker)" ]; then
  RELEASE=disco
  sudo apt-get install -yqq \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

  sudo add-apt-repository -yu \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $RELEASE \
   stable"
  sudo apt-get install -yqq docker-ce docker-ce-cli containerd.io
fi
sudo usermod -a -G docker $USER
docker --version
