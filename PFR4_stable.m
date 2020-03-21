function [dydt] = PFR4_stable(z,pars,yvec)
% PFR4_STABLE 
% A -> B + C ; (g); adiabatic

mA0    = pars(1);  % kg/h
N      = pars(2);  % number of tubes
p      = pars(3);  % kPa
MA     = pars(4);  % molecular weight of dimethylketone kg/mol
S      = pars(5);  % surface m3
T0     = pars(6);  % temp of flow in of react K
R      = pars(7);  % gas constant
drHATr = pars(8);  % reaction enthalpy of A at 298K kJ/mol/K
drHBTr = pars(9);  % reaction enthalpy of B at 298K kJ/mol/K
drHCTr = pars(10); % reaction enthalpy of C at 298K kJ/mol/K

X = yvec(1); % conversion
T = yvec(2); % temp in react

% balance of mol flow
k = exp(34.34 - 34.222/T);
cA0 = p / (R*T0)*1000;
cA = cA0 * (1 - X)/(1 + X) *  T0/T;
r = k*cA;
nA0 = mA0/MA/N;
nA = nA0*(1 - X);
nB = nA0*X;
nC = nA0*X;

dXdz = r*S/nA0;

% balance of energy
dHTr = [drHATr, drHBTr, drHCTr]' * 1000; % J/mol
aa = [26.63, 0.183 , 45.86*10^(-6)]';
bb = [20.04, 0.0945, 30.95*10^(-6)]';
cc = [13.39, 0.077 , 18.71*10^(-6)]';

drHTr = dHTr(2) + dHTr(3) - dHTr(1); % J/mol
cpA = aa(1) + bb(1)*T - cc(1)*T^2; % J/mol/K
cpB = aa(2) + bb(2)*T - cc(2)*T^2;
cpC = aa(3) + bb(3)*T - cc(3)*T^2;

dTdz = -r*S*(drHTr + cpC + cpB - cpA);
dTdz = dTdz / (nA*cpA + nB*cpB + nC*cpC);

dydt = [dXdz,dTdz]';

end

