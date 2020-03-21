function [dydt] = BATCH1(t,pars,yvec)
% BATCH1 
% 2A + B -> C; (g)

T   = pars(1);
p0  = pars(2);
cA0 = pars(3);
k   = pars(4);
yA0 = pars(5);
yB0 = pars(6);
XA  = pars(7);
R   = pars(8);

t = yvec(1);

cB0 = cA0;

dXdt = 2*k*(cA0*(1-XA))^2*(1-0.5*XA);

dydt = dXdt';

end

