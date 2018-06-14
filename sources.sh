#!/bin/sh
remotes() {
  for f in $1/*; do
    echo -n $f: 
    (cd $f; git remote get-url origin) 2>/dev/null || echo $2
  done
}
# print repositories where the origin doesn't match the directory it's in
remotes scratch __NO_ORIGIN__ | grep -v __NO_ORIGIN__
remotes github __NO_ORIGIN__ | grep -v '\(@\|https://\)github'
remotes gitlab __NO_ORIGIN__ | grep -v @gitlab
remotes bitbucket __NO_ORIGIN__ | grep -v @bitbucket
