#!/bin/sh -e
# 2019/11/11: https://apt.syncthing.net/

if ! [ -x "$(command -v syncthing)" ]; then
  curl -s https://syncthing.net/release-key.txt | sudo apt-key add -
  sudo add-apt-repository -yu "deb https://apt.syncthing.net/ syncthing stable"
  sudo apt-get install -yqq syncthing

fi
if [ -z "$CI" ]; then
  sudo systemctl enable syncthing@$USER.service 
  sudo systemctl start syncthing@$USER.service 
fi
syncthing --version
