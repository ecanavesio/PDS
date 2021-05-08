s = load("data/te.txt");
N = length(s);
figure(16); clf;
stem(s);

fsRow = [697, 770, 852, 941];
fsCol = [1209, 1336, 1477];

x = [];
fm = 5000;
tf = 1/697*10;
figure(15); clf;
% n=1;
% for k1 = fsRow
%   for k2 = fsCol
%     x = [x; sampledSin(1, k1, 0, fm, 0, tf) + sampledSin(1, k2, 0, fm, 0, tf)];
%     subplot(4, 3, n);
%     stem(x(n,:));
%     n++;
%   end
% end

xRow = [];
for k = fsRow
  xRow = [xRow; sampledSin(1, k, 0, fm, 0, tf)];
end

xCol = [];
for k = fsCol
  xCol = [xCol; sampledSin(1, k, 0, fm, 0, tf)];
end

% for n = 1:12
%   figure(n); clf;
%   M = length(x(n,:));
%   c = [];
%   for m = 1:N-M;
%     c = [c, x(n,:)*s(m:m+M-1)];
%   end
%   stem(c);
% end

figure(2); clf;
for n = 1:4
  M = length(xRow(n,:));
  c = [];
  for m = 1:N-M;
    c = [c, xRow(n,:)*s(m:m+M-1)];
  end
  subplot(4,1,n);
  stem(c);
end

figure(3); clf;
for n = 1:3
  M = length(xCol(n,:));
  c = [];
  for m = 1:N-M;
    c = [c, xCol(n,:)*s(m:m+M-1)];
  end
  subplot(3,1,n);
  stem(c);
end
