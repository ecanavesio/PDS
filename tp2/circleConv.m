function y = circleConv(x, h)
% x = vector de N muestras
% h = vector de N muestras
  assert(length(x) == length(h));
  N = length(x);
  y = zeros(1,N);
  for k = 1:N
    for l = 1:N
      y(k) += h(l) * x(mod(N + k - l, N)+1);
    end
  end
