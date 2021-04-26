import os

def cpu():
    x = os.popen('cat /proc/loadavg').read().split()[:3]
    return ' '.join(x)

def ram():
    x = os.popen('free | grep "Mem:"').read().split()
    x_full = int(x[1])
    x_free = int(x[3])
    return '%.2f' % ((x_full - x_free) / x_full * 100) + '%'

def temp():
    return os.popen('sensors | grep "Package id 0"').read().split()[3]

def light():
    return '%.2f' % float(os.popen('xbacklight 2> /dev/null').read()) + 'lm'

print(cpu() + '  ' + ram() + '  ' + temp() + '  ' + light())
