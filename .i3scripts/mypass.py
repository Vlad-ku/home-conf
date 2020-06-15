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

# получаем массив для поиска (без паролей)
ls_fzf = []
for x in ls_names:
    cmd = cli2arr(f'pass {x}')
    text = str( cmd[2:] if len(cmd) > 2 else [] )
    ls_fzf.append(f'{x}\t{cmd[0]}\t{text}')

# вопрос - ответ в цикле
while True:
    # запускаем fzf для взаимодействия с пользователем
    str_fzf = '\n'.join(ls_fzf)
    fzf = cli2arr(f'echo "{str_fzf}" | fzf')
    if len(fzf) != 1:
        print('close')
        exit()

    # ищем имя целевого ключа
    name_key = ls_names[ls_fzf.index(fzf[0])]

    # копируем логин, пароль и чистим за собой
    [login, passw] = cli2arr(f'pass {name_key}')[:2]
    os.system(f'echo -n \'{login}\' | xclip -selection clipboard')
    input('login -> xclip [press Enter...] ')
    os.system(f'echo -n \'{passw}\' | xclip -selection clipboard')
    input('passw -> xclip [press Enter...] ')
    os.system('echo -n "" | xclip -selection clipboard')
    print('--------------------')
