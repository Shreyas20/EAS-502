%Question 8
clear all;
F = [-631 316 -156 144 -36;
-798 400 -195 180 -45;
900 -450 227 -204 51;
-28 14 -7 12 -1 ;
96 -48 24 -24 14;];
%% Normal
eigF = eig(F);

M=F;

for i=1:60;
    [Q,R] = qr(M);
    M=R*Q;
end
eigF;
diag(M);
res = [eigF,diag(M)]
%% Converting to hessenberg
FH = hess(F)


eigFH = eig(FH);

MH=FH;

for i=1:39;
    [Q,R] = qr(MH);
    MH=R*Q;
end
eigFH;
diag(MH);
res = [eigFH,diag(MH)]
