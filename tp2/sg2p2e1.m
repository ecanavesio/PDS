
x = [1, 4, -1, 6];
y = [2, 3, 0, 1, 1];

r1 = convolucion(x,y);
r2 = conv(x,y);

norm(r1 - r2) % error absoluto p-2

% using filter method
B = y;
A = 1;
r3 = filter(B, A, [x, zeros(1,length(y)-1)]);

norm(r1 - r3)

figure(1); clf;
subplot(5,1,1);
stem(x);
xlim([0, length(r1)])

subplot(5,1,2);
stem(y);
xlim([0, length(r1)])


subplot(5,1,3);
stem(r1);
xlim([0, length(r1)])

subplot(5,1,4);
stem(r2);
xlim([0, length(r1)])

subplot(5,1,5);
stem(r3);
xlim([0, length(r1)])