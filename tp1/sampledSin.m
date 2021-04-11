function [s, t] = sampledSin(A, fs, phi, fm, t0, tf)
  dt = 1 / fm;
  N = (tf - t0) * fm;
  
  t = (0 : N) * dt + t0;
  s = A * sin(2 * pi * fs * t + phi);