#!/bin/sh -eu
# Easily installed packages. This runs first.
# ...well, almost: `apt-get update` is slow, so we put it in the parent script to ease testing
if ! [ -x "$(command -v git)" ]; then
  sudo apt-get update
  sudo apt-get upgrade -yqq
  # software-properties-common is for apt-add-repository; others are self-evident
  sudo apt-get install -yqq screen vim git xclip curl wget rsync htop zsh software-properties-common cowsay lolcat
fi

screen --version || true # `screen --version` is nonzero for some reason
vim --version | head -n 1
git --version
curl --version | head -n 1
wget --version | head -n 1
rsync --version | head -n 1
htop --version | head -n 1
zsh --version
echo moo | cowsay
lolcat --version
