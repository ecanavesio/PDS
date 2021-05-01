function r = convolucion(x,y)
  N = length(x);
  M = length(y);
  R = N + M - 1;
  r = zeros(1,R);
  for m = 1:M
    r(m:N+m-1) += y(m) * x;
  end
