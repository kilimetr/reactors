function [dydt] = CSTR1_unstable(t,pars,yvec)
% CSTR1_UNSTABLE
% A + B -> C

cA0  = pars(1);
cB0  = pars(2);
cC0  = pars(3);
T    = pars(4);
Vdot = pars(5);
V    = pars(6);
A    = pars(7);
Ea   = pars(8);
R    = pars(9);

X = yvec(1);

k = A * exp(-Ea/(R*T));

dXdt = -Vdot/V + k*cB0*(1-X)^2 + (1-X)*Vdot/V;

dydt = dXdt;

end

