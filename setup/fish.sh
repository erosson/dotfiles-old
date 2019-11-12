#!/bin/sh -eu
# 2019/11/11: https://launchpad.net/~fish-shell/+archive/ubuntu/release-3
if ! [ -x "$(command -v fish)" ]; then
  sudo add-apt-repository -yu ppa:fish-shell/release-3
  sudo apt-get install -yqq fish
fi
fish --version
