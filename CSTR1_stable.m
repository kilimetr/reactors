function [res] = CSTR1_stable(pars,yvec)
% CSTR_stable state
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

cA = cA0 * (1-X);
cB = cB0 * (1-X);

r = k*cA*cB;


res(1) = cA0*Vdot - r*V - cA*Vdot;

res = res';
end

