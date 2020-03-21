% LEVENSPIEL1 
% 2A -> B ; (l)
clear all; close all; clc;

k    = 2;
cA0  = 1;
Vdot = 1;

%%% PFR
pars = [k, cA0, Vdot];

[VV,XX] = ode45(@(V,y) Levenspiel1(V,y,pars),[0 10], [0]);

cA = cA0*(1-2*XX); % control

rr = - Vdot/(-2) * (XX./VV);

figure(1);
plot(VV,rr,'x-b');


%%% CSTR
V = VV(end);
X = XX(end);
r = cA0*Vdot*X/V;

hold on;
plot(V,r,'ok'); title('Levenspiel Diagram for reaction 2A -> B'); xlabel('Volume [m3]'); 
ylabel('Reaction Rate [mol/m3/hod]'); legend('PFR','CSTR');
