% PFR2_STABLE 
% A + 2B -> 2D; C is inert; (g)

t     = 55;
p     = 500;
X     = 0.5;
yA0   = 0.2;
yB0   = 0.5;
yC0   = 0.3;
yD0   = 0;
Vdot  = 50;
ntot0 = 1;
R     = 8.314;

pars = [t, p, X, yA0, yB0, yC0, yD0, Vdot, ntot0, R];

yini   = [0.2 0.5 0];
ybound = [0 4];

[VV,yy] = ode45(@(V,y) PFR2_stable(V,y,pars), ybound, yini);

plot(VV,yy);