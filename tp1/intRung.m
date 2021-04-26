function t = intRung(t)
  if t >= 0 && t+eps < 1
    t = 1;
  else 
    t = 0;
  end
