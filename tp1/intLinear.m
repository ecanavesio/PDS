function [t] = intLinear(t)
  if abs(t) < 1
    t = 1 - abs(t);
  else 
    t = 0;
  end
