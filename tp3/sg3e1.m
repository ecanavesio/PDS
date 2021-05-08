A = 5;
fs = 5;
phi = 0;
fm = 80;

s1 = sampledSin(A, fs, phi, fm, 0, 1);
s2 = rampWave(fm, 0, 1);
s3 = squareWave(A, fs, phi, fm, 0, 1);
N = length(s1);
s4 = randn(1,N);

vMean = [mean(s1), mean(s2), mean(s3), mean(s4)];
vMax = [max(s1), max(s2), max(s3), max(s4)];
vMin = [min(s1), min(s2), min(s3), min(s4)];
vAmplitud = [norm(s1, inf), norm(s2, inf), norm(s3, inf), norm(s4, inf)];
vEnergy = [norm(s1, 2)^2, norm(s2, 2)^2, norm(s3, 2)^2, norm(s4, 2)^2];
vAction = [norm(s1, 1), norm(s2, 1), norm(s3, 1), norm(s4, 1)];
vPotenciaMedia = vEnergy / N;
vRMS = sqrt(vPotenciaMedia);