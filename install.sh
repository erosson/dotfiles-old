#!/bin/sh -eux
# usage:
#
#    curl https://raw.githubusercontent.com/erosson/dotfiles/master/install.sh | sh
sudo apt-get update
sudo apt-get install git
rm -rf dotfiles ; git clone https://github.com/erosson/dotfiles
for f in `ls -A dotfiles/`; do
	if [ "$f" != "install.sh" -a "$f" != ".git" ]; then
		ln -s dotfiles/$f || echo "skipped $f"
	fi
done
