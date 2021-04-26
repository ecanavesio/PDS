x = -8:8;

% 1. y[n] = g[n] * x[n];
% Causal, No lineal, Variante Temp, sin memoria

A = 1;
fs = 10;
Tm = 1/100;
omega = 2*pi*fs;

g = A * sin(omega * (0:length(x)-1) * Tm);
y = g .* x;

figure(1); clf;
subplot(2,2,1);
stem(x,y);

% 2. y[n] = sum {from = n-n0} {to = n+n0} x[k]
% No Causal, Lineal, Invariante Temp, con memoria

n0 = 2;

y = zeros(1,length(x));
for n = 1:length(x)
  for m = n-n0:n+n0
    if(m >= 1 && m <= length(x))
      y(n) = y(n) + x(m);
    end
  end
end

subplot(2,2,2);
stem(x,y);


% 3. y[n] = x[n] + 2
% Causal, No Lineal, Invariante Temp, ¿sin memoria?

y = x + 2;
subplot(2,2,3);
stem(x,y);

% 4. y[n] = n * x[n];
% Causal, No Lineal, Variante Temp, Sin memoria

y = zeros(1,length(x));
for n = 1:length(x)
  y(n) = n*x(n);
end
subplot(2,2,4);
stem(x,y);