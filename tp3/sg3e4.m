
fm = 50;
t0 = 0;
tf = 2;
N = (tf - t0)*fm;

s = [];
z = [];
t = t0 : 1/fm : (tf - 1/fm);
fs = 1:10;

figure(2); clf;
for k = fs
  s = [s; sampledSin(1, k, 0, fm, t0, tf)];
  subplot(5,2,k);
  stem(t, s(k, :));
end

amp = @()(rand()*4 + 1);
phi = @()(rand()*pi);

% 1. Mida el grado de parecido con dichas senoidales representando el
%    resultado en un gráfico de barras:

x1 = zeros(1,N);
A = linspace(1,5,10);
for k = fs
  x1 = x1 + A(k)*s(k,:);
end

c1 = x1 * s';

figure(1); clf;
subplot(2,3,1);
bar(fs, c1);
subplot(2,3,4);
stem(t, x1);

% 2. Vuelva a medir el grado de parecido pero con una combinación lineal en
%    la que se varı́a la fase de las senoidales:

phis = linspace(0,pi*2,10);
x2 = sampledSin(1, 1, phis(1), fm, t0, tf);
for k = 2:10
  x2 = x2 + sampledSin(1, k, phis(k), fm, t0, tf);
end

c2 = x2 * s';

subplot(2,3,2);
bar(1:10, c2);
subplot(2,3,5);
stem(t, x2);

% 3. realice el gráfico de barras para el caso de una señal cuadrada de 5.5 Hz

x3 = squareWave(1, 5.5, 0, fm, t0, tf);

c3 = x3 * s';
subplot(2,3,3);
bar(1:10, c3);
subplot(2,3,6);
stem(t, x3);

% -----------------
x4 = sampledSin(1, 5.5, 0, fm, t0, tf);

c4 = x4 * s';
figure(3); clf;
subplot(1,2,1);
bar(fs, c4);
subplot(1,2,2);
stem(t, x4);