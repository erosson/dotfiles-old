#!/bin/sh -eux

# Simple apt software installs
./setup/apt.sh

# Simple Configuration
./setup/capsesc.sh
./setup/git.sh

# Install things from outside Ubuntu's official repos
./setup/fish.sh
./setup/google-chrome.sh
./setup/atom.sh
./setup/docker.sh
./setup/nodejs.sh
./setup/yarn.sh
./setup/syncthing.sh

# Symlink config to home directory, only after software it depends on is installed
./setup/home.sh

# ssh-keygen needs manual input. do this last. don't do it for CI builds.
./setup/ssh-keygen.sh

# victory message, announced by a cow, with pretty rainbow colors
set +x
echo "dotfiles setup successful! Enjoy your new machine." | cowsay -f $(ls /usr/share/cowsay/cows/ | shuf | head -n 1) | lolcat
