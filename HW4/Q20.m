%Question 20
clear all
rFunc = @(x) ((1 + 25 .* (x.^2)).^-1);
xlin5 = linspace(-1,1,5);
xlin11 = linspace(-1,1,11);
xlin21 = linspace(-1,1,21);
ogX = linspace(-1,1,100);
ogY = rFunc(ogX);

y = rFunc(xlin5);
x = xlin5;
xx = xlin5;

yy = lagrange(xx,ogX,ogY);
plot(ogX,ogY,'-.',xx,yy,'-ok')

y = rFunc(xlin11);
x = xlin11;
xx = xlin11;

yy = lagrange(xx,ogX,ogY);
plot(ogX,ogY,'-.',xx,yy,'-ok')

%xx = xlin21;
xx = linspace(-1,1,21);

yy = lagrange(xx,ogX,ogY);
plot(ogX,ogY,'-.',xx,yy,'-ok')
xlim([-0.6 0.6]);

% Interp 5 points
x = ogX; 
v = ogY;
xq = xlin5;

vq1 = interp1(x,v,xq,'linear');
plot(x,v,'-.',xq,vq1,'-ok');
title('Spline Interpolation');

% Interp 11 points
x = ogX; 
v = ogY;
xq = xlin11;

vq2 = interp1(x,v,xq,'linear');
plot(x,v,'-.',xq,vq2,'-ok');
title('Spline Interpolation');

% Interp 21 points
x = ogX; 
v = ogY;
xq = xlin21;

vq1 = interp1(x,v,xq,'linear');
plot(x,v,'--',xq,vq1,'-ok');
title('Spline Interpolation');

% Interp cubic5 points
x = ogX; 
v = ogY;
xq = xlin5;

vq2 = interp1(x,v,xq,'spline');
plot(x,v,'-.',xq,vq1,'-ob',xq,vq2,'-o');

%pp = csape(x,v,'not-a-knot') 
title('Cubic Spline Interpolation');

% Interp cubic11 points
x = ogX; 
v = ogY;
xq = xlin11;

vq2 = interp1(x,v,xq,'cubic');
plot(x,v,'-.',xq,vq2,'-ok');
title('Cubic Spline Interpolation');

% Interp cubic21 points
x = ogX; 
v = ogY;
xq = xlin21;

vq2 = interp1(x,v,xq,'spline');
plot(x,v,'-.',xq,vq1,'-ob',xq,vq2,'-o');

title('Cubic Spline Interpolation');


%
v= rFunc(xlin21')
xq = xlin21
x = xlin21
vq1 = interp1(x,v,xq);
plot(x,v,'-ok',xq,vq1,':r');
title('(Default) Linear Interpolation');