function Xs = newtonroot(Xest)
imax = 100;
Err  = 1e-10;
for i = 1:imax
    Xi = Xest - (Xest^2/2-10*atan(Xest))/(Xest-10/(1+Xest^2));
    if (abs(Xi - Xest) < Err)
        Xs = Xi;
        break
    end
    Xest = Xi;
end
if i == imax
    fprintf('Solution was not obtained within %i iterations.\n',imax)
    Xs = ('No answer');
end
end