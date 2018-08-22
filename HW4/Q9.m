%Question 9
clear all;
F = [-631 316 -156 144 -36;
-798 400 -195 180 -45;
900 -450 227 -204 51;
-28 14 -7 12 -1 ;
96 -48 24 -24 14;];

E = [-101 51 -12 0 0;
-174 88 -20 0 0;
136 -68 19 0 0;
840 -420 105 -32 18;
2016 -1008 252 -84 46;];

[lam, lams,u] = DomEigen(E, [10;10;10;10;10], 5) 
eigen1=eig(E)
[aa,indices]=sort(eigen1,'descend')
lam1=eigen1(indices(1,:))
lam2=eigen1(indices(2,:))

fprintf("For matrix F")

[lamf,lamfs, u1] = DomEigen(F, [10;10;10;10;10], 5) 
eigen2=eig(F)
[aa,indices]=sort(eigen2,'descend')
lam21=eigen2(indices(1,:))
lam22=eigen2(indices(2,:))
function [lam,lams, u] = DomEigen(E, startvector, k)
for i = 1:k
    u = startvector/norm(startvector);
    startvector = E*u;
    lam = u'*startvector;
    lams=(u.^2)'*startvector;
    disp(u)
end
end

%As we can observe for matrix E, rate is convergence is high also
%difference between largest and second largest element is more as compared
%to F becausediffence in first and second eigen element is also
%comparatively more.