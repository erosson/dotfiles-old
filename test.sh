#!/bin/sh -eux
CONTAINER="dotfiles-container"
docker build -t "$CONTAINER" .
docker run "$CONTAINER"
