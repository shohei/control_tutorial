J = 3.2284E-6;
b = 3.5077E-6;
K = 0.0274;
R = 4;
L = 2.75E-6;
s = tf('s');
P_motor = K/(s*((J*s+b)*(L*s+R)+K^2));

zeta = -log(.16) / sqrt( pi^2 + (log(.16))^2 );
PM = 100*zeta
Wbw = (4/(0.04*zeta))*sqrt((1 - 2*zeta^2) + sqrt(4*zeta^4 - 4*zeta^2+2))

a = (1 - sin(PM*pi/180))/(1 + sin(PM*pi/180));
T = 1/(Wbw*sqrt(a));
zero = -1/T
pole = -1/(a*T)

