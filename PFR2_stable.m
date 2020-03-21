function [dydt] = PFR2_stable(V,yvec,pars)
% PFR2_STABLE 
% A + 2B -> 2D; C is inert; (g)

t     = pars(1);
p     = pars(2);
X     = pars(3);
yA0   = pars(4);
yB0   = pars(5);
yC0   = pars(6);
yD0   = pars(7);
Vdot  = pars(8);
ntot0 = pars(9);
R     = pars(10);

V = yvec(1);

T = t + 273.15;

nA0 = yA0 * ntot0;
nB0 = yB0 * ntot0;
nC0 = yC0 * ntot0;
nD0 = yD0 * ntot0;

nA =     nA0 * (1 -   X);
nB =     nB0 * (1 - 2*X);
nC = nC0;
nD = 2 * nA0 * X;

cA = nA * p / ( (nA + nB + nC + nD) * R * T);
cB = nB * p / ( (nA + nB + nC + nD) * R * T);

r = 2.5 * cA^0.5 * cB;

dnAdV = - r;
dnBdV = - 2*r;
dnDdV = + 2*r;

dydt = [dnAdV, dnBdV, dnDdV]';

end