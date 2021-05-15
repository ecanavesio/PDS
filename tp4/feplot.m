
function feplot(s, fm, fig)
  S = fft(s);
  figure(fig); clf;
  subplot(3,1,1);
  stem(s);
  subplot(3,1,2);
  plotfft(S, fm, @stem);
  subplot(3,1,3);
  plotfft(S, fm, @(x,y)(plot(x,log10(y))));