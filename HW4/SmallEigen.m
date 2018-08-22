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