fs = 5;

fm = [100, 25, 10, 4, 1, 0.5];

for indx = 1:6
  subplot(2,3,indx);
  [s, t] = sampledSin(1, fs, 0, fm(indx), 0, 1);
  stem(t, s);
endfor