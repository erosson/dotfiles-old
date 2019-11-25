#!/bin/sh -eu
# https://keybase.io/docs/the_app/install_linux
TMP=`mktemp --suffix=.deb`
curl https://prerelease.keybase.io/keybase_amd64.deb -o $TMP
sudo apt install $TMP
rm $TMP
run_keybase -g
