
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