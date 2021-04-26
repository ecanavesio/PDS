function [s, x] = gaussDist(mu, sigm, N, x0, xn)
% mu = media de la gaussiana
% sigm = desvío de la funcion de probabilidad
% N = número de muestras
% x0 = valor inicial del rango aleatorio
% xn = valor final del rango aleatorio
  x = rand(1,N) * (xn-x0) + x0;
  s = sign(x) .* exp(- 0.5 * ((x - mu) / sigm).^2);

% 1/(sqrt(2*pi) * sigm) ??