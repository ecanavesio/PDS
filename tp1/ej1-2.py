import math
import numpy
import matplotlib.pyplot as plt

def sync(A, fs, phi, fm, t0, tf):
  dt = 1/fm
  N = int((tf - t0) * fm)
  sn = []
  for i in range(0, N):
    x = 2 * math.pi * fs * (i*dt + t0) + phi
    if x == 0:
      sn.append(A)
    else:
      sn.append(A * math.sin(x) / x)
  return sn

plt.plot(sync(6, 10, 0, 100, -1, 1))
plt.show()