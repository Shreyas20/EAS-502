clear all
fprintf('#######Question 1#########')
%Question 1
X=[1,2,3;4,5,6;7,8,7;4,2,3;4,2,2]
fprintf('Modified Gram Schmidt')
[q,r]=mgs1(X)
errormgs=norm(q*r-X)
fprintf('Gram Schmidt')
[q1,r1]=gs1(X)
errorgs=norm(q1*r1-X)
fprintf('HouseHolder')
[uhh,rhh]=hqrd(X)
I=eye(size(X))
qhh=house_apply(uhh,I)
errorhh=norm(qhh*rhh-X)
y=[errorgs,errormgs,errorhh]
c = categorical({'Gram Schmidth','MGS','HouseHolder'});
figure
bar(c,y)
title('Question1')
%From the result we got for this matrix, it is observed that error for
%classical gram schmidt and modified GS is same.
%Error for householder is more.

%Question 2
fprintf('######Question 2########')
clear all
for c=2:10
    fprintf('###For matrix size %d###',c); 
    H=hilb(c)
    I=eye(c)
    fprintf('Modified Gram Schmidt')
    [q2,r2]=mgs1(H)
    errormgs1=norm(q2'*q2-I)
    fprintf('Gram Schmidt')
    [q3,r3]=gs1(H)
    errorgs1=norm(q3'*q3-I)
    fprintf('HouseHolder')
    [u4,r4]=hqrd(H)
    i4=eye(size(H))
    q4=house_apply(u4,I)
    errorhh1=norm(q4'*q4-I)
    fprintf('Inbuilt qr function')
    [Q,R]=qr(H)
    
    errorAct=norm(Q'*Q-I)
    y=[errorgs1,errormgs1,errorhh1,errorAct]
    x = categorical({'Gram Schmidth','MGS','HouseHolder','QR function'});
    figure
    bar(x,y)
    title(c)
end

%Question 3
fprintf('#######Question 3######')
clear all
t1 = linspace(0,1,50)
t=t1'
m=fliplr(vander(t))
A=m(:,[1:12])
b=cos(4*t)
fprintf('Solution of normal eq using cholesky')
R1=A'*A
R2=A'*b
R=chol(R1)
w=R\R2
x=R\w
n=norm(x)
fprintf('Solution of normal eq using Gram Schmidt QR decomp')
[Qg,Rg]=gs1(A)
xg=inv(Rg)*Qg'*b
ng=norm(xg)
fprintf('Solution of normal eq using Modified Gram Schmidt QR decomp')
[Qm,Rm]=mgs1(A)
xm=inv(Rm)*Qm'*b
nm=norm(xm)
fprintf('Solution of normal eq using HouseHolder QR decomp')
[Uh,Rh]=hqrd(A)
Ih=eye(size(A))
Qh=house_apply(Uh,Ih)
xh=inv(Rh)*Qh'*b
nh=norm(xh)
fprintf('Solution of normal eq using inbuilt QR decomp')
[Qi,Ri]=mgs1(A)
xi=inv(Ri)*Qi'*b
ni=norm(xi)

fprintf('Solution of normal eq using A\b command')
xn=A\b
nn=norm(xn)
fprintf('SVD decomposition')
[U,S,V]=svd(A,0)
xs= V*((U'*b)./diag(S))
ns=norm(xs)
y=[n,ng,nm,nh,ni,ns]
xb = categorical({'Cholesky','Gram Schmidth','MGS','HouseHolder','QR function','SVD'});
bar(xb,y)
title('Question3')
function [Q,R] =  mgs1(X)
    [n,p] = size(X);
    Q = zeros(n,p);
    R = zeros(p,p);
    for k = 1:p
        Q(:,k) = X(:,k);
        for i = 1:k-1
            R(i,k) = Q(:,i)'*Q(:,k);
            Q(:,k) = Q(:,k) - R(i,k)*Q(:,i);
        end
        R(k,k) = norm(Q(:,k))';
        Q(:,k) = Q(:,k)/R(k,k);
    end
end



function [Q,R] = gs1(X)
    [n,p] = size(X);
    Q = zeros(n,p);
    R = zeros(p,p);
    for k = 1:p
        Q(:,k) = X(:,k);
        if k ~= 1
            R(1:k-1,k) = Q(:,k-1)'*Q(:,k);
            Q(:,k) = Q(:,k) - Q(:,1:k-1)*R(1:k-1,k);
        end
        R(k,k) = norm(Q(:,k));
        Q(:,k) = Q(:,k)/R(k,k);
     end
end

function [u,nu] = housegen(x)
    u = x;
    nu = norm(x);
    if nu == 0
        u(1) = sqrt(2);
        return
    end
    u = x/nu;
    if u(1) >= 0
        u(1) = u(1) + 1;
        nu = -nu;
    else
        u(1) = u(1) - 1;
    end
    u = u/sqrt(abs(u(1)));
end
function [U,R] = hqrd(X)  
    [n,p] = size(X);
    U = zeros(size(X));
    m = min(n,p);
    R = zeros(m,m);
    for k = 1:min(n,p)
        [U(k:n,k),R(k,k)] = housegen(X(k:n,k));
        v = U(k:n,k)'*X(k:n,k+1:p);
        X(k:n,k+1:p) = X(k:n,k+1:p) - U(k:n,k)*v;
        R(k,k+1:p) = X(k,k+1:p);
    end
end

function Z = house_apply(U,X)
    H = @(u,x) x - u*(u'*x);
    Z = X;
    [~,n] = size(U);
    for j = n:-1:1
        Z = H(U(:,j),Z);
    end
end