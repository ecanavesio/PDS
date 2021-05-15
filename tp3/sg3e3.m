N = 50;
y = [-ones(1,floor(N/2)), ones(1,ceil(N/2))];
t = linspace(-1, 1, 50);

legO4 = @(a,b)(a .* sqrt(1.5)*t + b .* sqrt(3.5)*(2.5*t.^3 - 1.5*t));

a1 = sqrt(1.5);
b1 = - sqrt(7/32);

s = legO4(a1, b1);

% 1. Calcular el error cuadrático total con los coeficientes calculados en el ejemplo del libro:

ecmT = sum((s - y).^2)/N;

figure(1); clf;
plot(t,y);
hold on;
plot(t,s);

% 2. Calcular el error cuadrático total con pequeñas variaciones en torno a estos coeficentes α, construyendo
%    una gráfica en 3D con la variación en los coeficientes en x, y y el error
%    cuadrático total en z:

as = sqrt(0:0.1:3);
bs = - sqrt(0:1/64:1);
ZZ = zeros(length(bs), length(as));
for n = 1:length(bs)
  for m = 1:length(as)
    ZZ(n,m) = sum((legO4(as(m), bs(n)) - y).^2)/N;
  end
end

figure(2); clf;
surf(as, bs, ZZ);

% 3. Calcular el error cuadrático total con más coeficientes α, para comprobar cómo se reduce el error
%    cuadrático total al aumentar los coeficientes.

% alfa5 = sqrt(22)/16
c1 = sqrt(22)/16;

legO6 = @(a,b,c)(a .* sqrt(1.5)*t + b .* sqrt(3.5)*(2.5*t.^3 - 1.5*t) + c .* sqrt(22)/61440*(63*t.^5 - 70*t.^3 + 15 * t));

s2 = legO6(a1, b1, c1);
ecmT2 = sum((s2 - y).^2)/N;

figure(1);
plot(t,s2);
