clear all
close all
n = [10:10:500];
N = size(n,2);
for i = 1:N
      m = n(i);
      m
      A1 = rand(m,m) + 1000*eye(m);
      b1 = rand(m);
      tic
      x = Gauss_pivot(A1,b1);

      t(i) = toc;
end

loglog(n,t,'b-')
hold on
plot( [1e2, 1e3], [1e-2, 1e1] ,'k-')
