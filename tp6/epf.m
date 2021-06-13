function [p, est] = epf(E, r, g)

  V = E/r(1);
  est = 1 - (V(2:end)./V(1:end-1));
  p = 1;
  while p<length(est) && est(p)>g
    p++;
  end