figure(1);
clf;

% 1) y[n] - y[n-2] = x[n]
b = [1];
a = [1, 0, -1];
N = 10;

h1 = impulseResponse(b, a, N);
subplot(2,2,1);
stem(h1);


% 2) y[n] = x[n] + 0.5*x[n-1]
b = [1, 0.5];
a = [1];
h2 = impulseResponse(b, a, N);

subplot(2,2,2);
stem(h2);

% 3) y[n] - 0,5y[n-1] + 0,25y[n-2] = x[n]
b = [1];
a = [1, -0.5, 0.25];
h3 = impulseResponse(b, a, N);
subplot(2,2,3);
stem(h3);