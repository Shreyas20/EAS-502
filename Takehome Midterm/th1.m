%Problem 1
clear all
x =[1.02 0.95 0.87 0.77 0.67 0.56 0.44 0.3 0.16 0.01]'
y =[0.39 0.32 0.27 0.22 0.18 0.15 0.13 0.12 0.13 0.15]'

Y =x.^2
X =[y.^2 x.*y x y ones(size(y))]
c =X\Y
yline =c(5)+c(4)*y+c(3)*x+c(2)*x.*y+c(1)*y.*y
plot(x,Y,'b',x,yline,'r')
error =sqrt(sum((Y-yline).^2))
[xs, ys] = meshgrid(-1:0.1:2, -1:0.1:2);
figure;
title('Orbital of Planet')
hold on
contour(-1:0.1:2,-1:0.1:2,c(1)*ys.^2+c(2)*xs.*ys+c(3)*xs+c(4)*ys+c(5)-xs.^2,[0,0],'k-')
plot(x,y,'ro','LineWidth',2)


