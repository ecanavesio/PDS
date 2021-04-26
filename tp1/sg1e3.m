A = 3; 

Ts = 0.05;
fs = 1/Ts;

N = 40;
Tm = Ts/N;
fm = 1/Tm;

t1 = Tm * 6;
phi = - 2 * pi * fs * t1;


t = 0 : Tm : (0.1-Tm);
x = A * sin(2*pi*fs*t + phi);
subplot(3,1,1);
stem(t,x);


f = fft(x);

subplot(3,1,2);
stem(0:length(f)-1,abs(f));

phis = atan(imag(f)./real(f));
subplot(3,1,3);
stem(0:length(f)-1,phis);