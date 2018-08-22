%QUESTION 10
clear all
syms f(x)
f(x) = sin(x) - x.^3;
 
bRoots = bisect(inline(f(x)),0.5,1,10.^-6)
 
eq1Diff = inline(diff((f(x)),x))
[x niter] = newton(1,inline(f),eq1Diff)
 
falseroots = regulafalsi(inline(f),0.5,1,10.^-6)
