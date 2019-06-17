#!/usr/bin/python3
# -*- coding: UTF-8 -*-

import sys
import getopt
from os import environ
from os import path

file_paths = [
    environ['HOME'] + '/.bashrc',
    environ['HOME'] + '/.zshrc'
]

for file_path in file_paths:
    if not path.exists(file_path):
        continue

    ignore_lines = -1
    content = []
    with open(file_path, 'r', encoding='utf-8') as file_r:
        for line in file_r:
            if ignore_lines > 0 or'# docker alias' in line:
                ignore_lines = 2 if ignore_lines <= 0 else ignore_lines - 1
            else:
                content.append(line)

    with open(file_path, 'w', encoding='utf-8') as file_w:
        file_w.writelines(content)
