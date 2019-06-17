#!/bin/bash

function dncl() {
  if [ ! -d "$NODE_DIR/node" ] ; then
    echo "node-local is not installed"
    return
  fi
  docker run -it --rm \
    --env HOME=/data \
    -v $NODE_DIR/data:/data \
    -v $NODE_DIR/node:/usr/local \
    -v $(pwd):/srv \
    -w /srv --net=host \
    --user $(id -u):$(id -g) ubuntu:18.04 ${@:1}
}

alias node="dncl node"
alias npx="dncl npx"
alias npm="dncl npm"
alias cnpm="dncl cnpm"
alias vue="dncl vue"
