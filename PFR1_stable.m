function [dXdV] = PFR1_stable(V,yvec,pars)
%PFR1_stable state
% A + B -> C

cA0  = pars(1);
cB0  = pars(2);
cC0  = pars(3);
T    = pars(4);
Vdot = pars(5);
Ea   = pars(6);
R    = pars(7);
A    = pars(8);

X = yvec(1);

k = A * exp(-Ea/(R*T));

cA = cA0 * (1-X);
cB = cB0 * (1-X);

r = k*cA*cB;

dXdV = r / (Vdot*cA0);

end

