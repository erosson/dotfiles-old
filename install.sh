#!/bin/sh -eux
sudo apt-get update
sudo apt-get install git
rm -rf dotfiles ; git clone https://github.com/erosson/dotfiles
for f in `ls -A dotfiles/`; do
	if [ "$f" == "install.sh" ]; then
		ln -s dotfiles/$f || echo "skipped $f"
	fi
done
