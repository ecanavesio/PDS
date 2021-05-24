
% Sistema continuo
Hs = @(s) (12500 * s ./ (44 * s.^2 + 60625 * s + 625*1e4));

% Funcion para cálculo de decibelios
db10 = @(P)(10 * log10(P));

% Frecuencias en sistema continuo
f = 0:.1:500;

% Respuesta en frecuencia continuo
Hf = Hs(j*2*pi*f);

figure(1); clf;
subplot(2,2,1);
stem(f, abs(Hf));

subplot(2,2,2);
stem(f, db10(abs(Hf)));

% Obtenemos el máximo en amplitud
[Hfmax, kmax] = max(abs(Hf));
dbHfmax = db10(Hfmax);

% Obtenemos el mínimo absoluto de una caida de 3db de la amplitud a partir del máximo
% 10 log(pcut) = 10 log(pmax) - 3dB
[dbHfcut, kcut] = min(abs(db10(abs(Hf(kmax:end))) - (dbHfmax - 3)));

% Frecuencia de corte
fcut = f(kcut);
Tm = 1/(4*fcut);

w = linspace(0,pi,500);
% fap = w/pi*fcut;


% aproximación de euler 
% s = (1 - z^-1) / Tm
fHz_euler = @(z)(Hs((1 - z.^(-1))/Tm));

subplot(2,2,3);
stem(abs(fHz_euler(exp(j*w))));



% aproximación bilineal
% s = 2 / Tm * (1 - z^-1) /(1 + z^-1);
fHz_bilinear = @(z)( Hs(2/Tm * (1 - z.^(-1))./(1 + z.^(-1))) );

subplot(2,2,4);
stem(abs(fHz_bilinear(exp(j*w))));
