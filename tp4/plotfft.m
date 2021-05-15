function plotfft(F, fm, plotFunc)
  Nm = length(F);
  fmax = fm/2;
  N2 = floor(Nm/2);
  fx = (-N2 : N2) / N2 * fmax;
  fyi = [N2 + mod(Nm+1,2) + 2*mod(Nm,2):Nm , 1:N2 + mod(Nm+1,2) + mod(Nm,2)];
  
  plotFunc(fx, abs(F(fyi)));