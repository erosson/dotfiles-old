#!/bin/sh -eu
# 2019/11/11: https://flight-manual.atom.io/getting-started/sections/installing-atom/#platform-linux
if ! [ -x "$(command -v atom)" ]; then
  wget -qO - https://packagecloud.io/AtomEditor/atom/gpgkey | sudo apt-key add -
  sudo apt-add-repository -yu 'deb https://packagecloud.io/AtomEditor/atom/any/ any main'
  if [ -z "$CI" ]; then
    sudo apt-get install -yqq atom
  fi
fi
if [ -z "$CI" ]; then
  # `apm install` is not idempotent; this is. https://discuss.atom.io/t/apm-install-cmd-only-install-if-not-installed/18842/3
  for p in vim-mode-plus prettier-atom linter-eslint; do
    test -d ~/.atom/packages/$p || apm install $p
  done
  atom --version
fi
