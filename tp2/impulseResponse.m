function [h] = impulseResponse(b, a, N)
  % x = b[n]x[n], b[n-1]x[n-1], b[n-2]x[n-2], ...
  % y = a[n]y[n], a[n-1]y[n-1], a[n-2]y[n-2], ...

  h = zeros(1, N);
  M = length(a);
  h(1:length(b)) = b;

  for n = 1:N
    for m = 2:M;
      if(m > n)
        break;
      end
      h(n) = h(n) - a(m) * h(n-m+1);
    end
  end

  h = h / a(1);
