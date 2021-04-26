import os

def fnd(lst, fst):
    stat = False
    for item in lst:
        if fst in item:
            stat = True
    return stat

fltr = [
    '/',
    '/boot/efi',
    '/mnt/XDATA',
]

def mount():
    ret = []
    lines = os.popen('lsblk').read().split('\n')[1:-1]      # убираем первую и последнюю строки
    for line in lines:
        y = line.split()
        if fnd(lines, '└─' + y[0]):                         # если есть дочерние элементы, убираем
            continue
        if y[0][1] == '─':                                  # убираем символы иерархии
            y[0] = y[0][2:]
        if len(y) == 6:                                     # если не примонтирован, добавляем фикривный элемент
            y.append('')
        if y[6] in fltr:                                    # фильтруем точки монтирования
            continue
        ret.append( '`'.join([ y[0], y[3], y[6] ]) )
    if len(ret) == 0:
        return 'null'
    return ' - '.join(ret)

print( mount() )
