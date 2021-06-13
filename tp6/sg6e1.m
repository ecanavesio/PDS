a = [1, -0.3, 0.4, -0.2];
b = 1;

x = rand(1,10000);
x = x - mean(x);

s = filter(b, a, x);

p = 10;
R = xcorr(s, p); % auto-correlación
r = R(p+1:end);

[A, E] = levdur(r, p);

[p1, est] = epf(E, r, 0.01);
[p2, I] = akaike(E, length(s));

figure(1); clf;
subplot(2,1,1);
plot(est);

subplot(2,1,2);
plot(I);