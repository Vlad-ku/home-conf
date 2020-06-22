import os

arr = os.popen('free | grep "Mem:"').read().split()
print("free: " + "%.2f" % (int(arr[3]) / int(arr[1]) * 100) + "%")
