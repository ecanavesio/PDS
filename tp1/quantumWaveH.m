function [s] = quantumWaveH(A, H, s)
  sh = (s/A + 1)*(H-1)/2;
  for indx = 1:length(s)
    s(indx) = round(sh(indx));
  end
  s = (2*s/(H-1) - 1)*A;