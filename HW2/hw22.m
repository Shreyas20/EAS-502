x=[0 1 2 3 4 5 6]
y=[-0.02 1.1 1.98 3.05 3.95 5.1 6.02]
x1=x(:)
y1=y(:)
x2=x1.^2
X=[ones(size(x1)) x1]
beta=regress(y1,X)
X1=[ones(size(x1)) x1 x2]
beta1=regress(y1,X1)
Y=beta(1)+beta(2)*x1
Y1=beta1(1)+beta1(2)*x1+beta1(3)*x2

plot(x1,Y,'b')
hold on
plot(x1,Y1,'r')
plot(x1,y1,'*')
e=sqrt(sum((x1-Y).^2))
e1=sqrt(sum((x1-Y1).^2))