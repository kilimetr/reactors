cA0  = 2;
cB0  = 2;
cC0  = 0;
T    = 300;
Vdot = 10;
Ea   = 85000;
R    = 8.314;
A    = 4.4203*10^13;

pars = [cA0, cB0, cC0, T, Vdot, Ea, R, A];

% initial condition
X0 = 0;

% integrace
                                            % integration boundaries
[VV,yy] = ode45(@(V,y) PFR1_stable(V,y,pars), [0 800], [X0]);

plot(VV,yy);