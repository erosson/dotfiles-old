#!/bin/sh -e
# caps/esc swap
# https://askubuntu.com/questions/363346/how-to-permanently-switch-caps-lock-and-esc
if [ -z "$CI" ]; then
  dconf write /org/gnome/desktop/input-sources/xkb-options "['caps:swapescape']"
elif [ -x "$(command -v dconf)" ]; then
  echo "CI env: dconf was installed at some point? remove install script branching!"
  exit 1
else
  echo "CI env: caps/esc swap skipped" >&2
fi
