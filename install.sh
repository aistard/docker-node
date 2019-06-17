#!/bin/bash

SHELL="/bin/bash"
SHELL_RC="$HOME/.bashrc"
NODE_DIR="$HOME/.docker/docker-node"

function refresh() {
  if [ -n "$(echo $SHELL | grep zsh)" ]
  then
    echo "请执行 source $SHELL_RC, 或注销重新登录, 以完成安装"
  else
    . $SHELL_RC
  fi
}

function uninstall() {
  rm -rf $NODE_DIR
  ./bin/uninstall-alias.py
  refresh
}

while getopts "s:lu" arg #选项后面的冒号表示该选项需要参数
do
  case $arg in
    s)
      if [ -n "$(echo $OPTARG | grep zsh)" ]; then
        SHELL=$OPTARG
        SHELL_RC="$HOME/.zshrc"
      fi
      ;;
    l)
      LOCAL='-l'
      ;;
    u)
      uninstall
      exit 1
      ;;
    ?)
      exit 1
      ;;
  esac
done

if [ ! -d "$NODE_DIR/data" ]; then
  mkdir -p $NODE_DIR/data
fi

if [ -n "$LOCAL" ]
then
  cp -r ./node $NODE_DIR
  cp ./bin/docker-alias-local.sh $NODE_DIR
  docker pull ubuntu:18.04
else
  cp ./bin/docker-alias.sh $NODE_DIR
  docker pull xy599505/node
fi

./bin/install-alias.py -s $SHELL $LOCAL
refresh
