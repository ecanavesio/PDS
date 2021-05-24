% Ejercicio 1: Aplicando la Transformada Z, y utilizando la propiedad de despla-
%   zamiento en el tiempo, determine la función de transferencia H(z) de los
%   siguientes sistemas LTI causales:

% pkg load symbolic
% syms z;

% 1. y[n] − 1/2 y[n − 1] + 1/ 4 y[n − 2] = x[n]

hz1 = @(z)(1 ./ ( 1 - 1/2 * z.^(-1) + 1/4 * z.^(-2) ));


% 2. y[n] = y[n − 1] + y[n − 2] + x[n − 1]

hz2 = @(z)(z.^-1 ./ (1 - z.^(-1) + z.^(-2)));


% 3. y[n] = 7x[n] + 2y[n − 1] − 6y[n − 2]

hz3 = @(z)(7 ./ (1 - 2 * z.^(-1) + 6 * z.^(-2)));


% 4. y[n] = sum from k=0 to 7 { 2^(−k) x[n − k] }

% hz4 = @(z)(sum(2.^(-(0:7)) .*z.^(-(0:7))));
hz4 = @(z) 1 + 1 ./ (2 * z) + 1 ./ (4 * z .^ 2) + 1 ./ (8 * z .^ 3) + 1 ./ (16 * z .^ 4) + 1 ./ (32 * z .^ 5) + 1 ./ (64 * z .^ 6) + 1 ./ (128 * z .^ 7);


% Ejercicio 2: Encuentre la respuesta en frecuencia de los sistemas anteriores su-
%   poniendo una frecuencia de muestreo de 10kHz. Tenga en cuenta la relación
%   entre la Transformada Z y la Transformada de Fourier.

w = linspace(0, pi, 1000);

% 1. 

figure(1); clf;
stem(w*5000/pi, abs(hz1(exp(j*w))));


% 2. 

figure(2); clf;
stem(w*5000/pi, abs(hz2(exp(j*w))));

% 3. 

figure(3); clf;
stem(w*5000/pi, abs(hz3(exp(j*w))));

% 4. 

figure(4); clf;
stem(w*5000/pi, abs(hz4(exp(j*w))));