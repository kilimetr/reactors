function [res] = CSTR3_stable(pars,yvec)
% CSTR3_STABLE
% 2A -> B ; (l); isothermal

Vdot = pars(1);
cA0  = pars(2);
XA   = pars(3);
k    = pars(4);

V = yvec(1);

cA = cA0 * (1 - XA);
cB = 0.5 * cA0 * XA;

r = k*cA^2;

res = cA0 - 2*r*V - cA;

end

