%H(z) = 
%  1 − 2z^−1 + 2z^−2 − z^−3
%  -------------------------
%(1 − z^−1 )(1 − 0,5z^−1 )(1 − 0,2z^−1 )

b = [1, -2, 2, -1];
a = [1, -17/10, 4/5, -1/10];

% pkg load signal
figure(1); clf;
zplane(b,a);

h = impulseResponse(a, b, 400);


figure(2); clf;
stem(h);