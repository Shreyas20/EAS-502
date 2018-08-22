%Question 16
clc 
clear 
time_45 = [0:0.001:5]
time_23 = [0:0.000001:5]
initial_x = 4;

func = @(x,t) -700*x - 1000*exp(-t);

%using ode45
[t,x] = ode45(func,time_45,initial_x);

[t1,x1] = ode23s(func,time_23,initial_x);

plot(t,x)

plot(t1,x1)