import math
import numpy
import matplotlib.pyplot as plt


def sinDisc(A, fs, phi, fm, t0, tf):
  dt = 1/fm
  N = int((tf - t0) * fm)
  sn = []
  for i in range(0, N):
    sn.append(A * math.sin(2*math.pi*(i*dt + t0)*fs + phi))
  return sn

plt.plot(sinDisc(1, 10, 0, 100, 0, 1))
plt.show()
