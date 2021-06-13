% ------------------- REVISAR -------------------
fm = 500;
% fs = 10;
% ss = sampledSin(1, fs, 0, fm, 0, 1);

N = fm;
n = 1:N;

% Probando ventana de Gauss
% s1 = exp();
% s1 = [zeros(1, fm/4), s1, zeros(1, fm/4)];
% feplot(s1, fm, 1);

% Probando ventana de Hanning
s2 = 1/2 - 1/2*cos(2*pi*n/N);
s2 = [zeros(1, fm/4), s2, zeros(1, fm/4)];
feplot(s2, fm, 2);


% Probando ventana de Hamming
s3 = 27/50 - 23/50*cos(2*pi*n/N);
s3 = [zeros(1, fm/4), s3, zeros(1, fm/4)];
feplot(s3, fm, 3);
