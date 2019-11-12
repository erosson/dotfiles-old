#!/bin/sh -eu
# 2019/11/11: https://github.com/nodesource/distributions/blob/master/README.md#deb
# https://github.com/nodesource/distributions/blob/master/README.md#manual-installation
# via https://nodejs.org/en/download/package-manager/#debian-and-ubuntu-based-linux-distributions-enterprise-linux-fedora-and-snap-packages
if ! [ -x "$(command -v node)" ]; then
  #curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
  curl -sSL https://deb.nodesource.com/gpgkey/nodesource.gpg.key | sudo apt-key add -
  VERSION=node_12.x
  DISTRO="$(lsb_release -s -c)"
  sudo apt-get install -y nodejs
  sudo add-apt-repository -yu "deb https://deb.nodesource.com/$VERSION $DISTRO main"
  #sudo add-apt-repository -yu "deb-src https://deb.nodesource.com/$VERSION $DISTRO main"
  sudo apt-get install -yqq nodejs
fi
echo -n "node: "
node --version
echo -n "npm: "
npm --version
