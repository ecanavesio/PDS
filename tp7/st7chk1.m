
fm = 100;
t0 = 0;
tf = 5;
M = 3;

[s, t] = squareComps(1, 1, 0, fm, t0, tf, M);

N = length(t);

figure(1); clf;
for m = 1:M
  subplot(M+1,1,m);
  plot(t, s(m,:));
end

subplot(M+1,1,M+1);
plot(t, sum(s));


myFilt = exp(-j*pi/4*ones(1,N));
figure(2); clf;

subplot(2,1,1);
stem(abs(myFilt));

subplot(2,1,2);
stem(atan(-imag(myFilt)./real(myFilt)));


figure(3); clf;
sf = [];
for m = 1:M
  sf = [sf; ifft(fft(s(m,:)) .* myFilt)];
  subplot(M+1,1,m);
  plot(t, sf(m,:));
end
subplot(M+1,1,M+1);
plot(t, sum(sf));