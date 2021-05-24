syms s zm1 z;
symHs = 12500 * s / (44 * s^2 + 60625 * s + 625*1e4);

% Hs = matlabFunction(symHs);
Hs = @(s) (12500 * s ./ (44 * s.^2 + 60625 * s + 625*1e4));

% ⎡  60625   625⋅√6593⎤
% ⎢- ───── - ─────────⎥
% ⎢    88        88   ⎥
% ⎢                   ⎥
% ⎢  60625   625⋅√6593⎥
% ⎢- ───── + ─────────⎥
% ⎣    88        88   ⎦

db10 = @(P)(10 * log10(P));

f = 0:.1:500;

% acá estamos en continuo

% w = 2*pi*f
Hf = Hs(j*2*pi*f);

figure(1); clf;
subplot(2,2,1);
stem(f, abs(Hf));

% figure(2); clf;
subplot(2,2,2);
stem(f, db10(abs(Hf)));


% Obtenemos el máximo en amplitud
[Hfmax, kmax] = max(abs(Hf));
dbHfmax = db10(Hfmax);

% Obtenemos el mínimo absoluto de una caida de 3db de la amplitud a partir del máximo
% 10 log(pcut) = 10 log(pmax) - 3dB
[dbHfcut, kcut] = min(abs(db10(abs(Hf(kmax:end))) - (dbHfmax - 3)));

% Frecuencia y período de corte
fcut = f(kcut);
Tm = 1/(12*fcut);

% aproximación de euler 
% s = (1 - z^-1) / Tm

%symHz_euler = subs(symHs, s, (1-zm1)/Tm);

%             204937500⋅(1 - zm₁)             
% ────────────────────────────────────────────
%              2                              
% 946162008⋅zm₁  - 2886270891⋅zm₁ + 2018233883

%fHz_euler = matlabFunction(subs(symHz_euler,zm1, z^-1));
fHz_euler = @(z)( Hs((1 - z.^(-1))/Tm) );
% fHz_euler = @(z) 12500 * (6558 / 5 - 6558 ./ (5 * z)) ./ (44 * (6558 / 5 - 6558 ./ (5 * z)) .^ 2 + 85765750 - 79515750 ./ z)

w = linspace(0,pi/6,500);
fap = w/(pi/6)*fcut;

% figure(3); clf;
subplot(2,2,3);
stem(fap, abs(fHz_euler(exp(j*w))));


% aproximación bilineals
% s = 2 / Tm * (1 - z^-1) /(1 + z^-1);

% symHz_bilinear = subs(symHs, s, 2/Tm * (1 -zm1)/(1 + zm1));
%                                   2         
%          204937500 - 204937500⋅zm₁          
% ────────────────────────────────────────────
%              2                              
% 937439641⋅zm₁  - 3706523032⋅zm₁ + 2925333391

%fHz_bilinear = matlabFunction(subs(symHz_bilinear,zm1, z^-1));
fHz_bilinear = @(z)( Hs(2/Tm * (1 - z.^(-1))./(1 + z.^(-1))) );
%fHz_bilinear = @(z) 12500 * (13116 / 5 - 13116 ./ (5 * z)) ./ ((1 + 1 ./ z) .* (6250000 + 60625 * (13116 / 5 - 13116 ./ (5 * z)) ./ (1 + 1 ./ z) + 44 * (13116 / 5 - 13116 ./ (5 * z)) .^ 2 ./ (1 + 1 ./ z) .^ 2));
% figure(4); clf;
subplot(2,2,4);
stem(fap, abs(fHz_bilinear(exp(j*w))));