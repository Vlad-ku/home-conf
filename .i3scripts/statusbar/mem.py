import os

arr = os.popen('free | grep "Mem:"').read().split()
print("FREE " + "%.2f" % (int(arr[3]) / int(arr[1]) * 100) + "%")
