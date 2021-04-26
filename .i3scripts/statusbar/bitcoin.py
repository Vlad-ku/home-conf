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
    val2usd = rq(val, 'usd')
    val2rub = rq(val, 'rub')
    rub2usd = val2rub / val2usd
    return form(val2usd) + '  ' + form(val2rub) + '  ' + form(rub2usd)

print( m('ethereum') )
#  print( m('binancecoin') )
