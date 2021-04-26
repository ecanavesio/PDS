% Interpolacion

A = 1;
fs = 1;
phi = 0;
fm = 10;
t0 = 0;
tf = 1;

[s, t] = sampledSin(A, fs, phi, fm, t0, tf);

figure(1);
subplot(2,2,1);
stem(t, s);

fmm = fm*4;
tm = [t0: (1/fmm): (tf-1/fmm)];

% Interpolacion con escalon
[xm, Tmi, Tni] = interp(@intRung, s, 1/fm, 1/fmm, t0);
subplot(2,2,2);
stem(tm, xm);

% Interpolacion con lineal
xm = interp(@intLinear, s, 1/fm, 1/fmm, t0);
subplot(2,2,3);
stem(tm, xm);

% Interpolacion con sinc
xm = interp(@intSinc, s, 1/fm, 1/fmm, t0);
subplot(2,2,4);
stem(tm, xm);
