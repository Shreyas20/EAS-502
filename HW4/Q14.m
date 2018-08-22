%Question 14
clear all;
T= [1 20 40 60 80 100 120 ];
mu= [ 2.5*10.^-3 5.5*10.^-4 1*10.^-4 5*10.^-5 2*10.^-5 1.2*10.^-5 6*10.^-6  ];

lgmu = log(mu);
B = lgmu.*T
B= B'
oneMat = [1 1 1 1 1 1 1 ];
A = [T ;oneMat ];
A = A'

x = A\B
bVal = -x(2)
aVal = exp(x(1))
-bVal./T
plot(T,mu,'b')
plot(T,aVal*exp(-bVal./T),'red')