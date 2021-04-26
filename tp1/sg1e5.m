[s,t] = sampledSin(1, 4000, 0, 129, 0, 2);

subplot(2,1,1);
stem(t, s);

f = fft(s);

subplot(2,1,2);
stem(0:length(f)-1,abs(f));