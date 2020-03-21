% BATCH1 
% 2A + B -> C; (g)

T   = 500;
p0  = 16400;
cA0 = 0.2;
k   = 10;
yA0 = 0.5;
yB0 = 0.5;
XA  = 0.9;
R   = 8.314;

pars = [T, p0, cA0, k, yA0, yB0, XA, R];

[yy,tt] = ode45(@(y,t) BATCH1(t,pars,y), [0 100], 0);

plot(yy,tt);