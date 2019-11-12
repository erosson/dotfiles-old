#!/bin/sh -eu
# 2019/11/11: https://yarnpkg.com/en/docs/install#debian-stable
if ! [ -x "$(command -v yarn)" ]; then
  wget -qO - https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
  sudo add-apt-repository -yu "deb https://dl.yarnpkg.com/debian/ stable main"
  sudo apt-get install -yqq yarn
fi
echo -n "yarn: "
yarn global add meta
yarn --version
