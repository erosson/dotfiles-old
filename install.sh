#!/bin/sh -eux
# usage:
#
#    wget -O - https://raw.github.com/erosson/dotfiles/master/install.sh | sh
which git || (sudo apt update && sudo apt install -y git)
rm -rf code/dotfiles
mkdir -p code
(cd code && git clone git@github.com:erosson/dotfiles.git)
(cd code/dotfiles && ./setup.sh)
