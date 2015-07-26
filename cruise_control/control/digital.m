m = 1000;
b = 50;
u = 500;

s = tf('s');
P_cruise = 1/(m*s+b);

Ts = 1/50;

dP_cruise = c2d(P_cruise,Ts,'zoh')
Wn = 0.0072;
zeta = 0.6;

rlocus(dP_cruise)
zgrid(zeta, Wn)
axis ([-1 1 -1 1])

axis ([0.95 1 -.1 .1])

K = 451.1104;
sys_cl = feedback(K*dP_cruise,1);
r = 10;
figure
step(r*sys_cl,10);

m = 1000;
b = 50;
u = 500;

s = tf('s');
P_cruise = 1/(m*s+b);
Ts = 1/50;
dP_cruise = c2d(P_cruise,Ts,'zoh');

z = tf('z',Ts);
C = 0.2*(z - 0.999)/(z - 0.9998);

Wn = 0.0072;
zeta = 0.6;

rlocus(C*dP_cruise)
zgrid(zeta, Wn)
axis([0.98 1 -0.01 0.01])

K = 2.4454e+03;
sys_cl = feedback(K*C*dP_cruise,1);
r = 10;
step(r*sys_cl,10);

