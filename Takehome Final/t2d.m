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
figure()
plot(th2list,dt(1,:))
figure()
plot(theta11,xval)
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
m=10
Fn=m.*An

Wn=double(trapz(double(xval1),Fn))
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