fm = 100;
fs = 10;
desp = 5;

s1 = sampledSin(1, fs, 0, fm, 0, 1);
S1 = fft(s1);

N = length(s1);

figure(1); clf;
plotfft(S1, fm, @stem);

% Retardo temporal:
s2 = [s1(desp+1:end), s1(1:desp)];
S2 = fft(s2);

figure(2); clf;
plotfft(S2, fm, @stem);

% Retardo temporal en frecuncia:

S3 = S1 .* exp(-i*2*pi*(1:N)*desp/N);
s3 = ifft(S3);

figure(3); clf;
plotfft(S3, fm, @stem);

% Retardo temporal en frecuncia:

S4 = S1 .* ( cos(2*pi*(1:N)*desp/N) - i*sin(2*pi*(1:N)*desp/N) );
s4 = ifft(S4);

figure(4); clf;
plotfft(S4, fm, @stem);


% Resultados:

figure(5); clf;
subplot(2,2,1);
stem(s1);
subplot(2,2,2);
stem(s2);
subplot(2,2,3);
stem(s3);
subplot(2,2,4);
stem(s4);