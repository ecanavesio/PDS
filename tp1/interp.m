function [xm, Tmi, Tni] = interp(I, xn, Tn, Tm, t0)
% I = funcion interpolante
% xn = señal muestreada a frecuencia fn = 1/Tn
% Tn = periodo de muestreo de la señal de entrada
% Tm = periodo de muestreo de la señal de salida
% ------------------------------------------------
% xm = señal interpolada a fm = 1/Tm

  N = length(xn);
  M = Tn * N / Tm;
  xm = zeros(1,M);
  Tmi = [];
  Tni = [];

  % tn = t0:Tn:(t0+Tn*N-Tn);
  % tm = t0:Tm:(t0+Tm*M-Tm);
  for m = 0:M-1
    for n = 0:N-1
      Tmi = [Tmi, m*Tm];
      Tni = [Tni, n*Tn];
      xm(m+1) = xm(m+1) + xn(n+1) * I((m*Tm - n*Tn)/Tn);
    end
  end
