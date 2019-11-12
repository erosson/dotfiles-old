#!/bin/sh -e
# copied url from the download page; undocumented
if ! [ -x "$(command -v google-chrome)" ]; then
  DEB="$(mktemp)"
  wget -O "$DEB" https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
  if [ -z "$CI" ]; then
    sudo dpkg -i "$DEB"
  else
    # gui dependencies
    echo "CI env: skipping google-chrome"
  fi
fi
if [ -z "$CI" ]; then
  google-chrome --version
fi
