function integral = compTrap(a,b,n,f)
% f= Function 
% a= Initial point of integral 
% b=  Last point of interval
% n= # of sub-intervals ,must be integer
result=0; 
f= f; 
h = (b-a)/n; %Finding space between each subinterval
x = [a+h:h:b-h]; %Finding midpoints of each subintervals.
for i=1:n-1
    result =result+f(x(i));
end
result=h*(result+0.5*(f(a)+f(b)));
integral=result;
end
