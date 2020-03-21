close all; clear all; clc;

h = 0.005;

p2  = 100;        % [kPa]
p1  = 105;        % [kPa]
L   =   1;        % [m]
eta = 0.8905*10^(-3); % [Pas]
rho = 997.04;     % [kg/m3]

K  = (p2-p1)/L;
ny = eta/rho;

syms vx(y)
ode = diff(vx,y,2) == K/ny;
cond = [vx(-h) == 100, vx(h) == -10];

vxsol = dsolve(ode,cond); disp(vxsol);

y = (-h:0.00005:h)';

vx = 9876495542261651/85899345920000 - (6011024975861651*y.^2)/2147483648 - 11000*y;

plot(vx,y);

xlabel('Velocity [m/s]'); ylabel('Length of surfaces [m]'); title('Velocity Array with Laminar Flow');
