clc
clear
L=100
h=97
syms f(a)
f(a) = (100/2*a)-sinh(97/(2*a))

eq1Diff = inline(diff((f(a)),a))
[a] = newton(5,inline(f),eq1Diff)

x=linspace(-h/2,h/2,100)
y=a*cosh(x/a)
plot(x,y)
