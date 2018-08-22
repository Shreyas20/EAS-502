%Question 21
func21 = @(x) (1 + (x).^-2).^(1/2)

intG = compTrap(1,2,7,func21)
intOG = integral(func21,1,2)
errorTrap = (abs(intOG-intG)/intOG)*100

intSimp = compSimpsons(func21,1,2,2)
errorSimp = (abs(intOG-intSimp)/intOG)*100
