#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os

def cli2arr(inpstr):
    li = os.popen(inpstr).read()
    return [ x for x in li.split('\n') if len(x) > 0 ]

# длина части пути к целевой папке
len_home = len(cli2arr('cd ~/.password-store && pwd')[0] + '/')

# список файлов с ключами
ls_files = cli2arr('find ~/.password-store/* | grep "\.gpg"')

# список ключей (для запросов к pass)
ls_names = sorted([x[len_home: -4] for x in ls_files])

for x in ls_names:
    cmd = cli2arr(f'pass {x}')
    if len(cmd) < 2:
        print('--- ERROR ---')
        break
    if len(cmd) > 2:
        text = ';'.join(cmd[2:])
    else:
        text = ' '
    print(f'|{x}|{cmd[0]}|{cmd[1]}|{text}|')
