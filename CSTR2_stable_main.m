% CSTR2_STABLE 
% A + 0.5B -> 0.5C ; (g)

T     = 500;
p     = 16400;
yA0   = 0.5;
yB0   = 0.5;
X     = 0.9;
R     = 8.314;
ntot0 = 1;
k     = 10;

pars = [T, p, yA0, yB0, X, R, ntot0, k];

yguess = 50;

[ysol] = fzero(@(y) CSTR2_stable(pars,y),yguess);
