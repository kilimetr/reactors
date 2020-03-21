% PFR_3_STABLE
% A -> 2B

T   = 500;
p   = 4.1*101.325;
k1  = 2.7;
K   = 1.2;
nA0 = 10;
R   = 8.314;

pars = [T, p, k1, K, nA0, R];

Xini = 0;

V = 100; 

[VV,yy] = ode45(@(V,y) PFR3_stable(V,pars,y), [0 V], Xini);

X = yy;

nA = nA0 * (1 - X);

subplot(1,2,1);
plot(VV,yy);
subplot(1,2,2);
plot(VV,nA);