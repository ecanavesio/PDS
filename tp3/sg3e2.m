
[s, t] = sampledSin(2, 5, 0, 100, 0, 1);

figure(1); clf;
subplot(3,3,1);
stem(t, s);

% Modificando Amplitud

s1 = sampledSin(5, 5, 0, 100, 0, 1);
s2 = sampledSin(0.5, 5, 0, 100, 0, 1);

printf("Amplitud 5: %d\n", s*s1');
printf("Amplitud 0.5: %d\n", s*s2');

subplot(3,3,2);
stem(t, s1);

subplot(3,3,3);
stem(t, s2);

% Modificando frecuencia

s3 = sampledSin(2, 10, 0, 100, 0, 1);
s4 = sampledSin(2, 20, 0, 100, 0, 1);
s5 = sampledSin(2, 1, 0, 100, 0, 1);

printf("Frecuencia 10: %d\n", s*s3');
printf("Frecuencia 20: %d\n", s*s4');
printf("Frecuencia 1: %d\n", s*s5');

subplot(3,3,4);
stem(t, s3);

subplot(3,3,5);
stem(t, s4);

subplot(3,3,6);
stem(t, s5);

% Modificando fase

s6 = sampledSin(2, 5, 1, 100, 0, 1);
s7 = sampledSin(2, 5, pi/2, 100, 0, 1);
s8 = sampledSin(2, 5, pi, 100, 0, 1);

printf("Fase 1 rad: %d\n", s*s6');
printf("Fase pi/2 rad: %d\n", s*s7');
printf("Fase pi rad: %d\n", s*s8');

subplot(3,3,7);
stem(t, s6);

subplot(3,3,8);
stem(t, s7);

subplot(3,3,9);
stem(t, s8);