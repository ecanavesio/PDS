function [s, t] = rampWave(fm, t0, tf)
  dt = 1 / fm;
  N = (tf - t0) * fm;
  t = (0:N)*dt + t0;
  s = (t + abs(t))/2;