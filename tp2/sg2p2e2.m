x = [1, 3, 6, -1];
h = [2, 0, -1, 2];

y = circleConv(x, h);

figure(1); clf;
subplot(3, 1, 1);
stem(x);

subplot(3, 1, 2);
stem(h);

subplot(3, 1, 3);
stem(y);