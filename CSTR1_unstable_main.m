cA0  = 2;            % mol/dm3
cB0  = 2;            % mol/dm3
cC0  = 0;            % mol/dm3
T    = 350;          % K
Vdot = 10;           % dm3/min
V    = 200;          % dm3
A    = 4.4203*10^13; % dm3/mol/min
Ea   = 85000;        % J/K/mol
R    = 8.314;        % J/K/mol

pars = [cA0, cB0, cC0, T, Vdot, V, A, Ea, R];

yinitial = 0;

[tt,yy] = ode45(@(t,y) CSTR1_unstable(t,pars,y), [0 5], yinitial);

plot(tt,yy);