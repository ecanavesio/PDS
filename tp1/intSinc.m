function t = intSinc(t)
  if t == 0
    t = 1;
  else 
    t = sin(t)/t;
  end
