#!/bin/sh -eu
# install dotfiles - assuming we're at ~/code/dotfiles
DOTFILES="$(realpath $(dirname $0)/..)"
cd ~
for f in `ls -A $DOTFILES/home/`; do
  ln -s $DOTFILES/home/$f || echo "skipped symlinking ~/$f and continuing" >&2
done
# fish config is a little awkward since it has a subdirectory
mkdir -p ~/.config/fish/
rm -f ~/.config/fish/config.fish
ln -s $DOTFILES/config.fish .config/fish/config.fish
cd -
