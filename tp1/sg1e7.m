% Ruido aleatorio con distribusión gaussiana

A = 2;
fs = 10;
phi = 0;
fm = 200;
t0 = -1;
tf = 1;

In = 4;
mu = 0;
sigm = 1;

[s, t] = sampledSin(A, fs, phi, fm, t0, tf);

figure(1)
clf;

subplot(4,1,1);
stem(t,s);

[r, xn] = gaussDist(mu, sigm, length(s), -In, In);
subplot(4,1,2);
stem(t, r);

subplot(4,1,3);
stem(t, s+r);

subplot(4,1,4);
stem(xn, abs(r));

% Calculo de estacionariedad
R = [];
for m = 1:100
  r = gaussDist(mu, sigm, length(s), -In, In);
  R = [R; s+r];
end

Mu = mean(R);
Sigm = std(R);

figure(2);
subplot(2,1,1);
plot(Mu-s);

subplot(2,1,2);
plot(Sigm);