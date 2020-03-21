% CSTR3_STABLE
% 2A -> B ; (l); isothermal

Vdot = 25;
cA0  = 0.2;
XA   = 0.9;
k    = 10;

pars = [Vdot, cA0, XA, k];

yguess = 10;

[ysol] = fzero(@(y) CSTR3_stable(pars,y), yguess);

V = ysol;
tau = V/Vdot;

vysledky = [V tau]