
A = 5;
fs = 1;
phi = 0;
fm = 100;
t0 = 0;
tf = 5;

[s, t] = sampledSin(A, fs, phi, fm, t0, tf);

subplot(2, 2, 1);
stem(t, s);

% 1. Inversion operation
subplot(2, 2, 2);
stem(-t, s);

% 2. Rectification operation
subplot(2, 2, 3);
stem(t, abs(s));

% 3. Cuantizacion operation
sq = quantumWave(A, 2, s);
subplot(2, 2, 4);
stem(t, sq);