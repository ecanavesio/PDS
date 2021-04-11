function [s, t] = squareWave(A, fs, phi, fm, t0, tf)
  dt = 1 / fm;
  N = (tf - t0) * fm;
  t = (0:N)*dt + t0;
  s = x = 2 * pi * fs * t + phi;
  s(find(mod(x,2*pi) >= pi)) = A;
  s(find(mod(x,2*pi) < pi)) = -A;
