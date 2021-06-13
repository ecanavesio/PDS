function [s,t] = squareComps(A, fb, phi, fm, t0, tf, M)
  assert(M>0)
  [s, t] = sampledSin(A, fb, phi, fm, t0, tf);
  for k = 2:M
    s = [s; sampledSin(A/(2*k-1), fb*(2*k-1), phi, fm, t0, tf)];
  end
  s = 4/pi*s;
