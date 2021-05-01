A = 3; 

Ts = 0.05;
fs = 1/Ts;

N = 40;
Tm = Ts/N;
fm = 1/Tm;

t1 = Tm * 6;
phi = - 2 * pi * fs * t1;
figure(1); clf;

t = 0 : Tm : (0.1+11*Tm);
x = A * sin(2*pi*fs*t + phi);
subplot(3,1,1);
stem(t,x);


f = fft(x);
fmax = fm/2;
Nm = length(f);
N2 = floor(Nm/2);
fd = fmax / (floor(Nm/2) + 1);

fx = (-N2 : N2) / N2 * fmax;
fyi = [N2 + mod(Nm+1,2) + 2*mod(Nm,2):Nm, 1:N2 + mod(Nm+1,2) + mod(Nm,2)];

subplot(3,1,2);
stem(fx, abs(f(fyi)));

phis = atan(-imag(f)./real(f));
subplot(3,1,3);
stem(0:Nm-1,phis);