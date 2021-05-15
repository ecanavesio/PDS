if exist("s") == 0
  s = load("data/necg.txt");
end

figure(1); clf;
subplot(2,2,1);
stem(s);

fm = 360;

S = fft(s);
subplot(2,2,2);
plotfft(S, fm, @stem);

fmax = fm/2;
N = length(s);

% filtrar desde 40 Hz hasta 180 Hz

k40 = round(40*N/fm);
k180 = round(180*N/fm);

Sf = S;
Sf(k40:k180) = 0;
Sf(N - (k40:k180)) = 0;

subplot(2,2,4);
plotfft(Sf, fm, @stem);

subplot(2,2,3);
stem(ifft(Sf));