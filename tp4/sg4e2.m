fm = 100;

% a) señal senoidal discreta de 2Hz
s1 = sampledSin(1, 2, 0, fm, 0, 1);

% b) señal cuadrada periódica de 2Hz
s2 = squareWave(1, 2, 0, fm, 0, 1);

% c) señal senoidal discreta de 4Hz
s3 = sampledSin(1, 4, 0, fm, 0, 1);


% ---------------------------------------------------
% 1. Verifique si son ortogonales las señales a) y b), a) y c), b) y c).

printf("Comparando senoidal 2Hz vs onda cuadrada 2Hz  =  %d\n", s1 * s2');
printf("Comparando senoidal 2Hz vs senoidal 4Hz  =  %d\n", s1 * s3');
printf("Comparando onda cuadrada 2Hz vs senoidal 4Hz  =  %d\n", s2 * s3');

% 2. Calcule la TDF de las tres señales, y verifique la ortogonalidad de los pares
%    como en el ejercicio anterior, en este dominio transformado.

S1 = fft(s1);
S2 = fft(s2);
S3 = fft(s3);

printf("Comparando senoidal 2Hz vs onda cuadrada 2Hz  =  %d\n", S1 * S2');
printf("Comparando senoidal 2Hz vs senoidal 4Hz  =  %d\n", S1 * S3');
printf("Comparando onda cuadrada 2Hz vs senoidal 4Hz  =  %d\n", S2 * S3');

% 3. Redefina la señal c), como una senoidal pero de frecuencia 3.5 Hz. Verifique
%    si es ortogonal respecto a la señal a), en ambos dominios.

s4 = sampledSin(1, 3.5, 0, fm, 0, 1);
S4 = fft(s4);

printf("Comparando senoidal 2Hz vs senoidal 3.5Hz  =  %d\n", s1 * s4');
printf("Comparando senoidal 2Hz vs senoidal 3.5Hz  =  %d\n", S1 * S4');