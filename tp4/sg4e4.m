% ------------------- REVISAR -------------------
fm = 500;
fs = 10;
ss = sampledSin(1, fs, 0, fm, 0, 1);

N = length(ss);
n = 1:N;

% Probando delta Dirac
s1 = [1,zeros(1,N-1)];
feplot(s1, fm, 1);

% Probando ventana de Hanning
s2 = 1/2 - 1/2*cos(2*pi*n/N);
feplot(s2.*ss, fm, 2);


% Probando ventana de Hamming
s3 = 27/50 - 23/50*cos(2*pi*n/N);
feplot(s3.*ss, fm, 3);
