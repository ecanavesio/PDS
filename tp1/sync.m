function [s, t] = sync(A, fs, phi, fm, t0, tf)
  dt = 1/fm;
  N = (tf - t0) * fm;
  
  t = (0 : N) * dt + t0;
  x = 2 * pi * t * fs;
  s = sin(x);
  [_, p] = max(x == 0);
  s(p) = x(p) = 1;
  s = A * s ./ x;