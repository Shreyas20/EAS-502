%house
clear all
fileID1 = fopen('house_names.txt','r');
names=textscan(fileID1,'%s')
parties=load('house_parties.txt')
votes=load('house_votes.txt')
democrats=find(parties==100)
republicans=find(parties==200)
independant=find(parties~=100 & parties~=200)

%3(b)
[u1,s1,v1]=svd(votes)
plot(s1)

%3(c)
hxdem=u1(democrats,1)
hydem=u1(democrats,2)
hxrep=u1(republicans,1)
hyrep=u1(republicans,2)
hxind=u1(independant,1)
hyind=u1(independant,2)
figure
hold on
scatter(hxdem,hydem,'b')
scatter(hxrep,hyrep,'r')
scatter(hxind,hyind,'g')

[u,s,v]=svds(votes,2)
votes1=u*s*v'
s1=sign(votes1)
yeaPred=find(s1(:)==1)
nayPred=find(s1(:)==-1)
yeaAct=find(votes(:)==1)
countYea=numel(yeaAct)
nayAct=find(votes(:)==-1)
countNay=numel(nayAct)

yeaAccuracy=numel( intersect( yeaPred, yeaAct ) )
nayAccuracy=numel( intersect( nayPred, nayAct ) )
perYea=yeaAccuracy/countYea*100
perNay=nayAccuracy/countNay*100
fprintf('Percent of accurate results for yea is %d\n',perYea)
fprintf('Percent of accurate results for nay is %d\n',perNay)

C=zeros(403,1)
for i=1:403
    Y=numel(intersect(find(s1(i,:)==1),find(votes(i,:)==1)))
    N=numel(intersect(find(s1(i,:)==-1),find(votes(i,:)==-1)))
    P=Y+N
    C(i)=P/1602
end
figure,

plot(C)
title('Count of each representative')
figure,

plot(C,u(:,1))
title('correct prediction count vs U1')
xlabel('Correct no of prediction')
ylabel('U1')
