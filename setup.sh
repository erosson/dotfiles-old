#!/bin/sh -eux

sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install -y screen vim git xclip curl rsync htop zsh wget

# caps/esc swap
# https://askubuntu.com/questions/363346/how-to-permanently-switch-caps-lock-and-esc
set +u
[ -z "$CI" ] && dconf write /org/gnome/desktop/input-sources/xkb-options "['caps:swapescape']"
set -u

# install dotfiles - assuming we're at ~/code/dotfiles
cd ~
for f in `ls -A ~/code/dotfiles/home/`; do
  ln -s code/dotfiles/home/$f || echo "skipped $f"
done
mkdir -p ~/.config/fish/
rm -f ~/.config/fish/config.fish
ln -s ../../code/dotfiles/config.fish .config/fish/config.fish
cd -

# apt repositories
#release=(lsb_release -sc)
release="zesty"
old_release="xenial"
# google-chrome: https://www.ubuntuupdates.org/ppa/google_chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list'
# f.lux: https://github.com/xflux-gui/xflux-gui#install-instructions
#sudo add-apt-repository -y ppa:nathan-renniewaldock/flux
# fish: https://launchpad.net/~fish-shell/+archive/ubuntu/release-2
sudo apt-add-repository -y ppa:fish-shell/release-2
#sudo apt-add-repository -y "deb http://ppa.launchpad.net/fish-shell/release-2/ubuntu $release main"
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
# syncthing: https://apt.syncthing.net/
curl -s https://syncthing.net/release-key.txt | sudo apt-key add -
echo "deb https://apt.syncthing.net/ syncthing stable" | sudo tee /etc/apt/sources.list.d/syncthing.list
# tarsnap: https://www.tarsnap.com/pkg-deb.html
wget https://pkg.tarsnap.com/tarsnap-deb-packaging-key.asc -O - | sudo apt-key add -
sudo sh -c "echo \"deb http://pkg.tarsnap.com/deb/$release ./\" > /etc/apt/sources.list.d/tarsnap.list"

sudo apt-get update
sudo apt-get install -y google-chrome-stable nodejs yarn fish docker-ce atom syncthing tarsnap

. ./autostart.sh

yarn global add firebase-tools flow-bin@0.53.1 babel-cli
. ./atom.sh

# more file watchers. https://stackoverflow.com/questions/16748737/grunt-watch-error-waiting-fatal-error-watch-enospc
echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p

git config --global core.editor vim
git config --global push.followTags true
git config --global user.name 'Evan'
# rot13 email, because spambots. http://stackoverflow.com/questions/5442436/using-rot13-and-tr-command-for-having-an-encrypted-email-address
git config --global user.email `echo tvguho@rebffba.bet | tr '[A-Za-z]' '[N-ZA-Mn-za-m]'` 

# keygen needs manual input. do this last. don't do it for CI builds.
set +u
if [ -z "$CI" -a ! -e ~/.ssh/id_rsa ]; then
  ssh-keygen -t rsa
  xclip -sel clip ~/.ssh/id_rsa.pub
  sensible-browser https://github.com/settings/ssh
  sensible-browser https://gitlab.com/profile/keys
  sensible-browser https://bitbucket.org/account/ssh-keys/
fi
set -u
