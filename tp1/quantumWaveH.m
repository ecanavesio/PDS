function [s] = quantumWaveH(H, N, s)
  A = max(abs(s));
  sh = (s/A + 1)*(N-1)/2;
  for indx = 1:length(s)
    s(indx) = round(sh(indx));
  end
  s = (2*s/(N-1) - 1)*H;