#!/bin/sh -eux
# `apm install` is not idempotent; this is. https://discuss.atom.io/t/apm-install-cmd-only-install-if-not-installed/18842/3
for p in nuclide vim-mode-plus prettier-atom linter-eslint; do
  test -d ~/.atom/packages/$p || apm install $p
done
#apm disable linter
