#!/usr/bin/python3
# -*- coding: UTF-8 -*-

import sys
import getopt
from os import environ

alias_content = """
# docker alias
export NODE_DIR="$HOME/.docker/docker-node"
[ -e $NODE_DIR/docker-alias.sh ] && source $NODE_DIR/docker-alias.sh
"""

alias_content_local = """
# docker alias
export NODE_DIR="$HOME/.docker/docker-node"
[ -e $NODE_DIR/docker-alias-local.sh ] && source $NODE_DIR/docker-alias-local.sh
"""

opts, args = getopt.getopt(sys.argv[1:], "ls:", [
    "local",
    "shell="
])

file_name = '.bashrc'

for option, value in opts:
    if option in ['-l', '--local']:
        alias_content = alias_content_local
    elif option in ['-s', '--shell']:
        if 'zsh' in value:
            file_name = '.zshrc'

path = r'%s/%s' % (environ['HOME'], file_name)

ignore_lines = -1
content = []

with open(path, 'r', encoding='utf-8') as file_r:
    for line in file_r:
        if ignore_lines > 0 or'# docker alias' in line:
            ignore_lines = 2 if ignore_lines <= 0 else ignore_lines - 1
        else:
            content.append(line)
    [content.append(line + '\n') for line in alias_content.split('\n')[1:-1]]

with open(path, 'w', encoding='utf-8') as file_w:
    file_w.writelines(content)