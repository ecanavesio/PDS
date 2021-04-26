function [s, t] = sampledSin(A, fs, phi, fm, t0, tf)
  tm = 1 / fm;
  t = t0 : tm : (tf - tm);
  s = A * sin(2 * pi * fs * t + phi);