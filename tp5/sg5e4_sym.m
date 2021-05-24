syms s A B;

Hs = 12500 * s / (44 * s^2 + 60625 * s + 625*1e4);

s1 = (-60625 - 625*sqrt(sym(6593)))/88;
s2 = (-60625 + 625*sqrt(sym(6593)))/88;

ecu = 12500*s/sym(44) == A*(s - s1) + B*(s - s2);

As = solve(subs(ecu, s, s2));
Bs = solve(subs(ecu, s, s1));

% Check

Hs_chk = As / (s - s2) + Bs / (s - s1);

