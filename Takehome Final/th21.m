%Problem 1
clc
clear all
time_p = [0.001:0.001:5]
time_n = [-0.001:-0.001:-5]
time_45=union(time_n,time_p)

initial_y = 1;
func = @(y,t) y.*(-2*t+(1./t))
[t,y] = ode45(func,time_45,initial_y);
figure()
plot(t,y)
syms y(t)
ode=diff(y,t) == y.*(-2.*t+1./t);
cond= y(0)==1;
ySol(t) = dsolve(ode,cond)


