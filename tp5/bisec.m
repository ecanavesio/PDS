function [x, h] = bisec(f, a, b, tol, maxit)
  fa = sign(f(a));
  fb = sign(f(b));
  assert(a < b && sign(fa) != sign(fb));
  if !exist("tol") 
    tol = 1e-16;
  end
  if !exist("maxit")
    maxit = 1e10;
  end

  it = 1;
  x = (b-a)/2 + a;
  fx = f(x);
  if sign(fx) == sign(fa)
    a = x;
    fa = fx;
  else
    b = x;
    fb = fx;
  end

  while it<maxit && abs(fb-fa)>tol && abs(b-a)>tol
    it++;
    x = (b-a)/2 + a;
    fx = f(x);
    if sign(fx) == sign(fa)
      a = x;
      fa = fx;
    else
      b = x;
      fb = fx;
    end
  end