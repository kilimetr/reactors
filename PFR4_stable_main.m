% PFR4_STABLE 
% A -> B + C ; (g); adiabatic

mA0    = 8000;        % kg/h
N      = 40;          % number of tubes
p      = 162;         % kPa
MA     = 58*10^(-3);  % molecular weight of dimethylketone kg/mol
S      = 0.1;         % surface m3
T0     = 1035;        % temp of flow in of react K
R      = 8.314;       % gas constant
drHATr = -216.67;     % reaction enthalpy of A at 298K kJ/mol/K
drHBTr = -61.09;      % reaction enthalpy of B at 298K kJ/mol/K
drHCTr = -74.81;      % reaction enthalpy of C at 298K kJ/mol/K

pars = [mA0, N, p, MA, S, T0, R, drHATr, drHBTr, drHCTr];

y0 = [0 T0];

zEND = 0.1;

[zz,yy] = ode45(@(z,y) PFR4_stable(z,pars,y),[0 zEND], y0);

subplot(1,2,1)
plot(zz,yy(:,1));

subplot(1,2,2)
plot(zz,yy(:,2));