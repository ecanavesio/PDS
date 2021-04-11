import math
import numpy
import matplotlib.pyplot as plt

def squareWave(A, fs, phi, fm, t0, tf):
  dt = 1/fm
  N = int((tf - t0) * fm)
  sn = []
  for i in range(0, N):
    x = 2 * math.pi * fs * (dt * i + t0) + phi
    if x % 2*math.pi >= math.pi:
      sn.append(A)
    else:
      sn.append(-A)
  return sn

plt.plot(squareWave(1, 1, 0, 100, 0, 1))
plt.show()