function [L, t] = testlegendre(n,N)
  t = linspace(-1,1,N);
  L = 0;
  for k=0:n
    L = L + C(n,k)^2 * (t+1).^(n-k) .* (t-1).^k / 2^n;
  end
end

function r = C(n,p)
  r = factorial(n)/(factorial(p)*factorial(n-p));
end
