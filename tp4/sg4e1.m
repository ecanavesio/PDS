
Tm = 0.001;
fm = 1/Tm;
f1 = 10;
f2 = 20;

s = sampledSin(1, f1, 0, fm, 0, 1) + sampledSin(4, f2, 0, fm, 0, 1);
S = fft(s);

Nm = length(s);

% 1. Grafica de FFT:
fmax = fm/2;
N2 = floor(Nm/2);
fx = (-N2 : N2) / N2 * fmax;
fyi = [N2 + mod(Nm+1,2) + 2*mod(Nm,2):Nm, 1:N2 + mod(Nm+1,2) + mod(Nm,2)];

figure(1); clf;
stem(fx, abs(S(fyi)));

% 2. Verifique la relación de Parseval para la TDF:

Es1 = s * s';
Es2 = 1/Nm * sum(abs(S).^2);

% ------------------------------------------------------------------------
% Parte 2:
% 1. Modifique s[n] de forma tal que:
%    s[n] = sin(2πf 1 t) + 4 sin(2πf 2 t) + 4
%    analice los cambios en el espectro de magnitud de S[k].

s1 = s + 4;
S1 = fft(s1);

figure(2); clf;
stem(fx, abs(S1(fyi)));

% 2. Modifique las frecuencias de las señales seno de forma tal que f1 = 10 Hz y
%    f2 = 11 Hz y analice los cambios en el espectro de magnitud de S[k].

s2 = sampledSin(1, f1, 0, fm, 0, 1) + sampledSin(4, 11, 0, fm, 0, 1);
S2 = fft(s2);

figure(3); clf;
stem(fx, abs(S2(fyi)));

% 3. Modifique nuevamente las frecuencias de las señales seno de forma tal que
%    f1 = 10 Hz y f2 = 10,5 Hz. ¿Qué ocurre en el espectro de magnitud de S[k]?

s3 = sampledSin(1, f1, 0, fm, 0, 1) + sampledSin(4, 10.5, 0, fm, 0, 1);
S3 = fft(s3);

figure(4); clf;
stem(fx, abs(S3(fyi)));

% 4. Modifique el intervalo de tiempo de análisis de la siguiente manera
%    t = [0 ... 2) seg. y analice los cambios en la TDF.

s4 = sampledSin(1, f1, 0, fm, 0, 2) + sampledSin(4, f2, 0, fm, 0, 2);
S4 = fft(s4);

Nm4 = length(s4);
N24 = floor(Nm4/2);
fx = (-N24 : N24) / N24 * fmax;
fyi = [N24 + mod(Nm4+1,2) + 2*mod(Nm4,2):Nm4, 1:N24 + mod(Nm4+1,2) + mod(Nm4,2)];

figure(5); clf;
stem(fx, abs(S4(fyi)));