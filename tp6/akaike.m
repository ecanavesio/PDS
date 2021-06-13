function [p, I] = akaike(E, N)
  I = log2(E(2:end)) + 2*[1:length(E)-1]/N;
  [~, p] = min(I);