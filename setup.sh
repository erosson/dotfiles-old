#!/bin/sh -eux

# install dotfiles - assuming we're at ~/code/dotfiles
cd ~
for f in `ls -A ~/code/dotfiles/`; do
  if [ "$f" != "install.sh" -a "$f" != ".git" ]; then
    ln -s code/dotfiles/$f || echo "skipped $f"
  fi
done

# apt repositories
#release=(lsb_release -sc)
release="zesty"
old_release="xenial"
# google-chrome: https://www.ubuntuupdates.org/ppa/google_chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list'
# f.lux: https://github.com/xflux-gui/xflux-gui#install-instructions
sudo add-apt-repository -y ppa:nathan-renniewaldock/flux
# fish: https://launchpad.net/~fish-shell/+archive/ubuntu/release-2
#sudo apt-add-repository -y ppa:fish-shell/release-2
sudo apt-add-repository -y "deb http://ppa.launchpad.net/fish-shell/release-2/ubuntu $release main"
# dropbox: https://www.dropbox.com/help/desktop-web/linux-repository
sudo apt-key adv --keyserver pgp.mit.edu --recv-keys 1C61A2656FB57B7E4DE0F4C1FC918B335044912E
#sudo add-apt-repository -y "deb http://linux.dropbox.com/ubuntu (lsb_release -sc) main"
#sudo add-apt-repository -y "deb http://linux.dropbox.com/ubuntu $release main"
sudo add-apt-repository -y "deb http://linux.dropbox.com/ubuntu $old_release main"
# docker: https://askubuntu.com/questions/938700/how-do-i-install-docker-on-ubuntu-16-04-lts
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
#sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu (lsb_release -cs) stable"
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $release stable"
# atom: https://launchpad.net/~webupd8team/+archive/ubuntu/atom , https://github.com/atom/atom/issues/2956
sudo add-apt-repository -y ppa:webupd8team/atom
# node: https://nodejs.org/en/download/package-manager/#debian-and-ubuntu-based-linux-distributions
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
# yarn: https://yarnpkg.com/lang/en/docs/install/
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
sudo apt update
sudo apt upgrade -y
sudo apt install -y screen vim git xclip curl rsync htop zsh
sudo apt install -y google-chrome-stable fluxgui nodejs yarn fish docker-ce atom

sudo chsh -s /usr/bin/fish `whoami` 

yarn global add firebase-tools flow-bin babel-cli
# `apm install` is not idempotent; this is. https://discuss.atom.io/t/apm-install-cmd-only-install-if-not-installed/18842/3
for p in nuclide vim-mode-plus; do
  test -d ~/.atom/packages/$p || apm install $p
done

git config --global user.name 'Evan'
# rot13 email, because spambots. http://stackoverflow.com/questions/5442436/using-rot13-and-tr-command-for-having-an-encrypted-email-address
git config --global user.email `echo tvguho@rebffba.bet | tr '[A-Za-z]' '[N-ZA-Mn-za-m]'` 

# keygen needs manual input. do this last.
if [ ! -e ~/.ssh/id_rsa ]; then
  ssh-keygen -t rsa
  xclip -sel clip ~/.ssh/id_rsa.pub
  sensible-browser https://github.com/settings/ssh
  sensible-browser https://gitlab.com/profile/keys
  sensible-browser https://bitbucket.org/account/ssh-keys/
fi