function [s] = quantumWave(A, H, s)
  for indx = 1:length(s)
    s(indx) = sign(s(indx)) * round(abs(s(indx))/A*H)*A/H;
  end