for i=1:16
    a(i)=10^(-i);
    e(i)=abs(cos(pi/3)-((sin((pi/3)+a(i))-sin(pi/3))/a(i)));
    
end
e
loglog(a,e)
hold on

