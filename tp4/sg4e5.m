fs = 27;
fm = 50;
A = 2;

s = sampledSin(A, fs, 0, fm, 0, 1);
S = fft(s);

figure(1); clf;
subplot(4,1,1)
plotfft(S, fm, @stem);

% 1. Determine la frecuencia de la señal que observa. Explique la discrepancia con
%    frecuencia de la señal original.

% vemos una señal de 23 Hz
% Aliasing


% 2. Deduzca una ecuación para determinar cómo se genera la señal de la fre-
%    cuencia observada, a partir de la frecuencia original y los parámetros del
%    muestreo. Verifique la validez de su ecuación para otras señales, por ejemplo
%    una de 105 Hz.

Tm = 1/fm; % resolucion temporal
fmax = fm/2;
rf = 1/(N*Tm); % resolucion frecuencial


fo = abs(fs - fm * round(fs/fm));


fs2 = 105;
s2 = sampledSin(A, fs2, 0, fm, 0, 1);
S2 = fft(s2);
fo2 = abs(fs2 - fm * round(fs2/fm));
figure(2); clf;
plotfft(S2, fm, @stem);


% 3. Determine la relación entre la magnitud observada de la transformada y la
%    amplitud de la señal original.
figure(1);

% Amplitud en frecuencia = A*N/2 en cada palito.

s3 = sampledSin(3, fs, 0, fm, 0, 1);
S3 = fft(s3);
subplot(4,1,2);
plotfft(S3, fm, @stem);

s1 = sampledSin(1, fs, 0, fm, 0, 1);
S1 = fft(s1);
subplot(4,1,3);
plotfft(S1, fm, @stem);

s4 = sampledSin(A, fs, 0, fm, 0, 2);
S4 = fft(s4);
subplot(4,1,4);
plotfft(S4, fm, @stem);