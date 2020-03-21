function [dXdV] = Levenspiel1(V,yvec,pars)
% LEVENSPIEL1 
% 2A -> B ; (l)

k    = pars(1);
cA0  = pars(2);
Vdot = pars(3);

X = yvec(1);

r = k * cA0^2 * (1 - X)^2;

dXdV = - (-2) * r/Vdot;

end
