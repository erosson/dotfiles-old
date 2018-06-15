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

# print repositories with unpushed changes. doesn't make sense for scratch/, nothing to push to.
for f in github/* gitlab/* bitbucket/*; do
  if [ -d "$f/.git" ]; then
    cd "$f"
    # uncommitted changes
    [ -z "`git status -s`" ] || (echo "$f:" && git status -s && echo)
    # committed-but-unpushed changes
    # https://stackoverflow.com/questions/3258243/check-if-pull-needed-in-git
    [ "`git rev-parse HEAD`" = "`git rev-parse '@{u}'`" ] || (echo "$f:" && git branch -v && echo)
    cd - >/dev/null
  fi
done
