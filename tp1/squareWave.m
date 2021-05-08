function [s, t] = squareWave(A, fs, phi, fm, t0, tf)
  tm = 1 / fm;
  t = t0 : tm : (tf - tm);
  s = x = 2 * pi * fs * t + phi;
  s(find(mod(x,2*pi) < pi)) = A;
  s(find(mod(x,2*pi) >= pi)) = -A;
