
%%2B(i)
clc
clear all
theta=load('E:\ds-sem1\545\theta1.dat', '-mat');
dt = theta.t_theta
%%

%%2B(ii)
l1=0.5
l2=0.75
syms f(the2)
syms f1(x)
l1=0.5
l2=0.75
xval=[]
thlist=[]
for j=1:20
    syms f(the2)
    syms f1(x)
    fprintf('value %d', j);
    the1=dt(2,j)
     f(the2)= (l1).*sin(the1)- (l2).*sin(the2)
     df=inline(diff((f(the2)),the2))
     %df=inline('12*cos(the2)','the2')
     x0=1
     [the2, error, n_its] = newton_1d(inline(f),df,x0,1.0e-6,1000)
     f1(x)= (l1).*cos(the1)- (l2).*cos(the2)+x
     df1=inline(diff((f1(x)),x))
     %f1=inline('0.75*cos(the2)+0.5*cos(the1)+x','x')
     %df1=1
     [x, error, n_its] = newton_1d(f1,df1,x0,1.0e-6,1000)
     thlist = [thlist,the2]
     xval=[xval,x]
     

end 
%%

%%2B(iii)
figure()

plot(dt(2,:),dt(1,:))
title('theta1 vs time')
figure()
plot(thlist,dt(1,:))
title('theta2 vs time')
figure()
plot(dt(1,:),xval)
title('theta1 vs x values')
t=dt(1,:)
theta1=dt(2,:)

coef1=polyfit(t,xval,3)
A=coef1(1).*3.*2.*t+coef1(2).*2

fun= @(T) coef1(1).*T.^3+coef1(2).*T.^2+coef1(3).*T+coef1(4)
dfun= @(T) coef1(1).*3.*T.^2+coef1(2).*2.*T+coef1(3)
ddfun= @(T) coef1(1).*3.*2.*T+coef1(2).*2.*T

T=linspace(0,1,100);
F=fun(T);
h=T(2)-T(1);
TCentral=T(2:end-1);
dTCenteral=(F(3:end)-F(1:end-2))/(2*h);
TForward=T(1:end-1);
dFForward=(F(2:end)-F(1:end-1))/h;
TBackward=T(2:end);
dFBackward=(F(2:end)-F(1:end-1))/h;

figure()
plot(T,dfun(T));
hold on
plot(TCentral,dTCenteral,'r')
plot(TForward,dFForward,'k');
plot(TBackward,dFBackward,'g');
legend('Analytic','Central','Forward','Backward')
title('velocity vs time')

T=linspace(0,1,100);
F1=dfun(T);
h=T(2)-T(1);
TCentral1=T(2:end-1);
dTCenteral1=(F1(3:end)-F1(1:end-2))/(2*h);
TForward1=T(1:end-1);
dFForward1=(F1(2:end)-F1(1:end-1))/h;
TBackward1=T(2:end);
dFBackward1=(F1(2:end)-F1(1:end-1))/h;

figure()
plot(T,ddfun(T));
hold on
plot(TCentral1,dTCenteral1,'r')
plot(TForward1,dFForward1,'k');
plot(TBackward1,dFBackward1,'g');
legend('Analytic','Central','Forward','Backward')
title('acceleration vs time')
m=10
F=m.*A

%%
%%2B(v)
figure()
plot(xval,F)
title('force vs x')
%%
%%2B(vi)
W=double(trapz(double(xval),F))
%%

%%2C
theta1=dt(2,:)
A1=[t',-theta1']
B=[theta1.*t]'
c=A1\B

theta11= c(1).*(t./(t+c(2)))
figure()
plot(theta11,t,'blue')
hold on
plot(theta1,t,'red')
title('calculated theta1 and actual theta 1 vs t')
%%
%%2D
th2list=[]
xval1=[]
for j=1:20
    syms f(thet2)
    syms f1(x1)
    thet1=theta11(j)
    fprintf('value %d', j);
    
     fn1(thet2)= (l1).*sin(thet1)- (l2).*sin(thet2)
     dfn1=inline(diff((fn1(thet2)),thet2))
     %df=inline('12*cos(the2)','the2')
     x0=1
     [thet2, error, n_its] = newton_1d(inline(fn1),dfn1,x0,1.0e-6,1000)
     fn11(x1)= (l1).*cos(thet1)- (l2).*cos(thet2)+x1
     dfn11=inline(diff((fn11(x1)),x1))
     %f1=inline('0.75*cos(the2)+0.5*cos(the1)+x','x')
     %df1=1
     [x1, error, n_its] = newton_1d(fn11,dfn11,x0,1.0e-6,1000)
     th2list = [th2list,thet2]
     xval1=[xval1,x1]
     

end  
figure()
plot(dt(2,:),dt(1,:))
title('theta1 calculated vs time')
figure()
plot(th2list,dt(1,:))

title('theta2 new vs time')
figure()
plot(theta11,xval)

title('theta1 calculated vs x value')
t=dt(1,:)

coef2=polyfit(t,xval1,3)
An=coef2(1).*3.*2.*t+coef2(2).*2

funn= @(T) coef2(1).*T.^3+coef2(2).*T.^2+coef2(3).*T+coef2(4)
dfunn= @(T) coef2(1).*3.*T.^2+coef2(2).*2.*T+coef2(3)
ddfunn= @(T) coef2(1).*3.*2.*T+coef2(2).*2.*T

T=linspace(0,1,100);
Fn=funn(T);
h=T(2)-T(1);
TCentraln=T(2:end-1);
dTCenteraln=(Fn(3:end)-Fn(1:end-2))/(2*h);
TForwardn=T(1:end-1);
dFForwardn=(Fn(2:end)-Fn(1:end-1))/h;
TBackwardn=T(2:end);
dFBackwardn=(Fn(2:end)-Fn(1:end-1))/h;

figure()
plot(T,dfunn(T));
hold on
plot(TCentraln,dTCenteraln,'r')
plot(TForwardn,dFForwardn,'k');
plot(TBackwardn,dFBackwardn,'g');
legend('Analytic','Central','Forward','Backward')

title('new velocity vs time')

T=linspace(0,1,100);
F1n=dfunn(T);
h=T(2)-T(1);
TCentral1n=T(2:end-1);
dTCenteral1n=(F1n(3:end)-F1n(1:end-2))/(2*h);
TForward1n=T(1:end-1);
dFForward1n=(F1n(2:end)-F1n(1:end-1))/h;
TBackward1n=T(2:end);
dFBackward1n=(F1n(2:end)-F1n(1:end-1))/h;

figure()
plot(T,ddfunn(T));
hold on
plot(TCentral1n,dTCenteral1n,'r')
plot(TForward1n,dFForward1n,'k');
plot(TBackward1n,dFBackward1n,'g');
legend('Analytic','Central','Forward','Backward')

title('new acceleration vs time')
m=10
Fn=m.*An
figure()
plot(xval1,Fn);
title('new piston force vs x')

Wn=double(trapz(double(xval1),Fn))



%%
 % Dr. Paul T. Bauman
%
% Goal: Function implements the Newton method for finding the roots
%       of a nonlinear equation.
%
% Input: func - function handle to nonlinear function
%        deriv - function handle to the derivative of the nonlinear
%        function
%        x0 - double, initial guess
%        tol - double, error tolerance
%        max_iters - integer, maximum number of iterations allowed.
%
% Output: x - double, estimated root of nonlinear equation in func
%         error_est - double, value of the estimated error of our solution
%         num_iters - integer, number of iterations it took to converge

function [ x, error_est, num_iters ] = newton_1d( func, deriv, x0, tol, max_iters )

% Set current solution iterate to the initial guess.
x = x0;

% Loop for the maximum number of iterations.
for i = 1:max_iters

    % Get the function value at the current solution iterate.
    f = func(x);

    error_est(i) = abs(f);

    if( error_est(i) < tol )
       break
    end
    
    % Get the first derivative of the nonlinear function at 
    % the current solution iterate.
    df = deriv(x);
   
    if( df == 0)
        error('Zero derivative detected!')
    end
    
    if( abs(df) < 1.0e-15 )
        error('Numerically zero derivative detected!')
    end

    % x_{i+1} = x_{i} - f( x_{i} )/dfdx( x_{i} )
    x = x - f/df;
    
end

num_iters = i;
end