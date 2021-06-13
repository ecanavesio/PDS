function [A, E] = levdur(r, P) 
% Algoritmo de Levinson-Durbin
  A = zeros(P);
  E = zeros(1, P+1);
  E(1) = r(1);
  
  for n = 1:P
    aux = r(n+1);
    % aux = r(n+1) + sum(A(1:n-1,n-1) .* r(n-1:-1:1));
    for m = 1:n-1
      aux = aux + A(m,n-1)*r(n-m+1);
    end
    
    k = -aux/E(n);
    A(n,n) = k;
    for m = 1:n-1
      A(m,n) = A(m,n-1) + k*A(n-m,n-1);
    end
    E(n+1) = E(n) * (1-k^2);
  end