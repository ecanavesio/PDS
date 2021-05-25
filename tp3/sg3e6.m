[escalas, fm] = audioread("tp3/data/escala.wav");

figure(1); clf;
subplot(3,1,1);
stem(escalas);

% sound(escalas); % reproduce sonido

fs = 440; % frecuencia de la señal a buscar;

N = length(escalas);

%% -----------------------------------------------------------------

Nw = floor(fm*0.5); % ancho en número de muestras de ventana.

fcomps = []; % vector de comparaciones corriendo ventana;

sf = sampledSin(1, fs, 0, fm, 0, 0.5);

for m = 1:N-Nw-1
  fcomps = [fcomps, sf*escalas(m:m+Nw-1)];
end

subplot(3,1,2);
stem(fcomps);

[P, kpos] = max(abs(fcomps));

%% -----------------------------------------------------------------

sf2 = sampledSin(1, fs, 0, fm, 0, 0.1);

Nw2 = length(sf2);

fcomps2 = [];

for m = 1:N-Nw2-1
  fcomps2 = [fcomps2, sf2*escalas(m:m+Nw2-1)];
end

subplot(3,1,3);
stem(fcomps2);

[P2, kpos2] = max(abs(fcomps2));