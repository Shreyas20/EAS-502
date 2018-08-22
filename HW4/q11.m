clc
clear all
f001 = inline('4*exp(-0.5*x)-x*exp(-0.5*x)-2');
f01p = inline('(x*exp(-x/2)-6*exp(-x/2))/2');

[x,iterations] = newton(2,f001,f01p)
[x1,iterations1] = newton(6,f001,f01p)
[x2] = newton(8,f001,f01p)
