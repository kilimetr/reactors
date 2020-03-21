function [dydt] = PFR3_stable(V,pars,yvec)
% PFR_3_STABLE
% A -> 2B

T   = pars(1);
p   = pars(2);
k1  = pars(3);
K   = pars(4);
nA0 = pars(5);
R   = pars(6);

X = yvec(1);

cTOT = p / (R*T);

cA = cTOT * (1 - X) / (1 + X);
cB = cTOT * 2 * X / (1 + X);

r = k1 * (cA - cB^2 / K);

dXdV = - r / nA0;

dydt = dXdV;

end

