import requests

# сколько один ethereum стоит в переданной валюте
def rq(v1, v2):
    url = 'https://api.coingecko.com/api/v3/simple/price?ids='+v1+'&vs_currencies='+v2 #+'&include_24hr_change=true'
    return requests.get(url).json()[v1][v2]

# форматирование float числа
def form(val):
    return '{:,.2f}'.format(val).replace(',', '`')

# запросы для разных валют
def m(val):
    if val == '':
        return form(rq('ethereum', 'rub') / rq('ethereum', 'usd'))
    else:
        return form(rq(val, 'usd')) + '  ' + form(rq(val, 'rub'))

print(' | '.join([
    m('bitcoin'),
    m('ethereum'),
    m('polkadot'),
    m('')
]))
#  print( m('binancecoin') )
