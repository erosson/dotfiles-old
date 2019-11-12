#!/bin/sh -e
# ssh-keygen needs manual input. do this last. don't do it for CI builds.
if [ -z "$CI" -a ! -e ~/.ssh/id_rsa ]; then
  ssh-keygen -t rsa
  xclip -sel clip ~/.ssh/id_rsa.pub
  sensible-browser https://github.com/settings/ssh
  sensible-browser https://gitlab.com/profile/keys
  sensible-browser https://bitbucket.org/account/ssh-keys/
else
  echo "skipping ssh-keygen: key already exists (or CI env)" 
fi
