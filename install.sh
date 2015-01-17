#!/bin/sh -eux
# usage:
#
#    wget -O - https://raw.github.com/erosson/dotfiles/master/install.sh | sh
sudo apt-get update
sudo apt-get install git -y
rm -rf dotfiles ; git clone https://github.com/erosson/dotfiles
for f in `ls -A dotfiles/`; do
	if [ "$f" != "install.sh" -a "$f" != ".git" ]; then
		ln -s dotfiles/$f || echo "skipped $f"
	fi
done
git config --global user.name 'Evan Rosson'
# rot13 email, because spambots. http://stackoverflow.com/questions/5442436/using-rot13-and-tr-command-for-having-an-encrypted-email-address
git config --global user.email `echo tvguho@rebffba.bet | tr '[A-Za-z]' '[N-ZA-Mn-za-m]'` 

sudo apt-get install zsh screen vim -y
sudo chsh -s /bin/zsh `whoami` 

# keygen needs manual input. do this last.
test -e ~/.ssh/id_rsa || ssh-keygen -t rsa
echo 'https://github.com/settings/ssh'
cat ~/.ssh/id_rsa.pub
