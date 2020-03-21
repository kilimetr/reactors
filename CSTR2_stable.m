function [res] = CSTR2_stable(pars,yvec)
% CSTR2_STABLE 
% A + 0.5B -> 0.5C ; (g)

T     = pars(1);
p     = pars(2);
yA0   = pars(3);
yB0   = pars(4);
X     = pars(5);
R     = pars(6);
ntot0 = pars(7);
k     = pars(8);

V = yvec(1);

nA0 = yA0 * ntot0;
nB0 = yB0 * ntot0;

nA =       nA0 * (1 - X);
nB =       nB0 * (1 - 0.5*X);
nC = 0.5 * nA0 * X;

cA =     (1 - X)*p / ((1.5 - X)*R*T);
cB = 0.5*(1 - X)*p / ((1.5 - X)*R*T); 

r = k * cA^2 * cB;

res = nA0 - r*V - nA;

end

