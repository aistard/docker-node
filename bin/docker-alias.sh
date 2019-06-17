#!/bin/bash

function dnc() {
  docker run -it --rm \
    -v $NODE_DIR/data:/home/node \
    -v $(pwd):/srv \
    -w /srv --net=host \
    --user $(id -u):$(id -g) xy599505/node ${@:1}
}

alias node="dnc node"
alias npx="dnc npx"
alias npm="dnc npm"
alias cnpm="dnc cnpm"
alias vue="dnc vue"
