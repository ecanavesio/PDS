
a = 0.25;

hA = @(n)(sin(8*n));
hB = @(n)(a.^n);

N = 500;

ns = 0:N-1;

ha = hA(ns);
hb = hB(ns);

x = [1, -a, zeros(1, N-2)];

y1 = conv(conv(x, ha), hb)(1:N);
y2 = conv(conv(x, hb), ha)(1:N);

figure(1); clf;

subplot(6,1,1);
stem(ns, ha);

subplot(6,1,2);
stem(ns, hb);

subplot(6,1,3);
stem(ns, x);

subplot(6,1,4);
stem(ns, y1);

subplot(6,1,5);
stem(ns, y2);

subplot(6,1,6);
stem(ns, y1-y2);