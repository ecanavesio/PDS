s = load("data/te.txt");
N = length(s);
figure(16); clf;
stem(s);

fsRow = [697, 770, 852, 941];
fsCol = [1209, 1336, 1477];

ns = zeros(7,2);
ns(1,:) = [17000, 21000];
ns(2,:) = [30000, 34500];
ns(3,:) = [39600, 43300];
ns(4,:) = [48500, 52700];
ns(5,:) = [59000, 63300];
ns(6,:) = [69700, 74500];
ns(7,:) = [80400, 85600];

xn = [0, 17000, 17000, 21000, 21000, 30000, 30000, 34500, 34500, 39600, 39600, 43300, 43300, 48500, 48500, 52700, 52700, 59000, 59000, 63300, 63300, 69700, 69700, 74500, 74500, 80400, 80400, 85600, 85600, N];
yn = [0, 0, 1.5, 1.5, 0, 0, 1.5, 1.5, 0, 0, 1.5, 1.5, 0, 0, 1.5, 1.5, 0, 0, 1.5, 1.5, 0, 0, 1.5, 1.5, 0, 0, 1.5, 1.5, 0, 0];

hold on;
plot(xn, yn, 'r');

fm = 5000;
cs = [];
rs = [];
for l = 1:7
  N = ns(l,2) - ns(l,1);
  tf = N / fm;

  phiRow = [];
  cmaxRow = [];
  for n = 1:4
    phi1 = 0;
    cmax = 0;
    for phi = 0:pi/100:pi/2
      x = sampledSin(1, fsRow(n), phi, fm, 0, tf);
      c = x * s(ns(l,1):ns(l,2)-1);
      if c > cmax
        phi1 = phi;
        cmax = c;
      end%if c > cmax
    end%for phi = 0:pi/100:pi/2
    phiRow = [phiRow, phi1];
    cmaxRow = [cmaxRow, cmax];
  end%for n = 1:3

  phiCol = [];
  cmaxCol = [];
  for n = 1:3
    phi1 = 0;
    cmax = 0;
    for phi = 0:pi/100:pi/2
      x = sampledSin(1, fsCol(n), phi, fm, 0, tf);
      c = x * s(ns(l,1):ns(l,2)-1);
      if c > cmax
        phi1 = phi;
        cmax = c;
      end%if c > cmax
    end%for phi = 0:pi/100:pi/2
    phiCol = [phiCol, phi1];
    cmaxCol = [cmaxCol, cmax];
  end%for n = 1:3

  [_, r1] = max(cmaxRow);
  [_, c1] = max(cmaxCol);

  rs = [rs, r1];
  cs = [cs, c1];
end%for l = 1:7

% rs = 4   1   1   1   4   1   3
% cs = 3   2   2   2   1   3   2
% ds = #   2   2   2   *   3   8   | esto está claramente bien