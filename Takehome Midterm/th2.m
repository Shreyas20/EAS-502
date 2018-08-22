clear all
%2a(ii)
A=[1/3 1/3 2/3;2/3 2/3 4/3;1/3 2/3 3/3;2/5 2/5 4/5;3/5 1/5 4/5]
s = svd(A);
tol = max(size(A))*eps(max(s));
r = sum(s > tol);
r

%2a(iii)
elem=zeros(2000,1)
for i=1:2000
    x=vpa((0.9)^i)
    elem(i)=x
end
A2000=diag(elem)
s = svd(A2000);
tol = max(size(A2000))*eps(max(s));
r2k = sum(s > tol);
r2k

%2b(i)
x =[1.02 0.95 0.87 0.77 0.67 0.56 0.44 0.3 0.16 0.01]'
y =[0.39 0.32 0.27 0.22 0.18 0.15 0.13 0.12 0.13 0.15]'
Y =x.^2
X =[y.^2 x.*y x y ones(size(y))]
a=-0.005
b=0.005
r =a+ (b-a).*rand(10,1)
xn=x+r
yn=y+r
Yn =xn.^2
Xn =[yn.^2 xn.*yn xn yn ones(size(yn))]
cn =Xn\Yn
ynline =cn(5)+cn(4)*yn+cn(3)*xn+cn(2)*xn.*yn+cn(1)*yn.*yn
error1 =sqrt(sum((Yn-ynline).^2))
[x1s, y1s] = meshgrid(-1:0.1:2, -1:0.1:2);
figure;
title('For noicy data')
hold on
contour(-1:0.1:2,-1:0.1:2,cn(1)*y1s.^2+cn(2)*x1s.*y1s+cn(3)*x1s+cn(4)*y1s+cn(5)-x1s.^2,[0,0],'k-')
plot(xn,yn,'ro','LineWidth',2)

%2b(ii)

for i=1:5
    tol=10^(-i)
    r=rank(X,tol)
    [U,S,V]=svds(X,r)
    Xn=U*S*V'
    c=Xn\Y
    [xs, ys] = meshgrid(-1:0.1:2, -1:0.1:2);
    figure;
    title=('Eliptical orbit for normal data with rank approximation')
    hold on
    contour(-1:0.1:2,-1:0.1:2,c(1)*ys.^2+c(2)*xs.*ys+c(3)*xs+c(4)*ys+c(5)-xs.^2,[0,0],'k-')
    plot(x,y,'ro','LineWidth',2)
end
for i=1:5
    a=-0.005
    b=0.005
    r =a+ (b-a).*rand(10,1)
    xn=x+r
    yn=y+r
    Yn =xn.^2
    Xn =[yn.^2 xn.*yn xn yn ones(size(yn))]
    tol=10^(-i)
    r=rank(X,tol)
    [U,S,V]=svds(X,r)
    Xn=U*S*V'
    c=Xn\Y
    cn =Xn\Yn
    ynline =cn(5)+cn(4)*yn+cn(3)*xn+cn(2)*xn.*yn+cn(1)*yn.*yn
    error1 =sqrt(sum((Yn-ynline).^2))
    [x1s, y1s] = meshgrid(-1:0.1:3, -1:0.1:3);
    figure;
    
    title=('Eliptical orbit for noicy data with rank approximation')
    hold on
    contour(-1:0.1:3,-1:0.1:3,cn(1)*y1s.^2+cn(2)*x1s.*y1s+cn(3)*x1s+cn(4)*y1s+cn(5)-x1s.^2,[0,0],'k-')
    plot(xn,yn,'ro','LineWidth',2)
end