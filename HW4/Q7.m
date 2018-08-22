clear all;
A = [2 1 0; 1 2 1; 0 1 2];
%7a
[lam1, u] = DomEigen(A, [1;1;1], 3) %largest 2.9600 0.0021132
%7b
[lam2, u] = SmallEigen(A, [2;-2;2],0,  3) %smallest 0.5983 0.0021132

%7c
ratio = lam1/lam2; %ratio
disp("The Ratio of the largest Eigen Value to smallest Eigen Value is " +ratio)
con = cond(A)
eigen = eigs(A)
eigen(1)
eigen(3)
disp("smallest computed Eigen value by inverse power method is "+lam2)
disp("Largest computed Eigen value by power method is "+lam1)
disp("smallest computed Eigen value by eig function is "+eigen(1))
disp("Largest computed Eigen value by eig function is "+eigen(3))
disp("The error percent for max Eigen value is " +(abs(eigen(3) - lam1)/eigen(3)) * 100)
disp("The error percent for min Eigen value is " +(abs(eigen(1) - lam2)/eigen(1)) * 100)

disp("The error percent for Condition number is " +(abs(con - ratio)/con) * 100)

function [lam, u] = DomEigen(A, startvector, k)
for i = 1:k
    u = startvector/norm(startvector);
    startvector = A*u;
    lam = u'*startvector;
end
end

% inverse 
function [lam, u] = SmallEigen(A, startvector, s, k)
As =  A- s*eye(size(A));
for i = 1:k
    u = startvector/norm(startvector);
    startvector = As\u;
    lam = u'*startvector;
end
lam = 1/lam + s;
u = startvector/norm(startvector);
end

%From the values we got above, the % error between values of ratio of
%largest to smallest eigen values with conditional number is very small
%that is 0.0042%.

%