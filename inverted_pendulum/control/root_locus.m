M = 0.5;
m = 0.2;
b = 0.1;
I = 0.006;
g = 9.8;
l = 0.3;
q = (M+m)*(I+m*l^2)-(m*l)^2;
s = tf('s');
P_pend = (m*l*s/q)/(s^3 + (b*(I + m*l^2))*s^2/q - ((M + m)*m*g*l)*s/q - b*m*g*l/q);

rlocus(P_pend)
title('Root Locus of Plant (under Proportional Control)')

C = 1/s;
rlocus(C*P_pend)
title('Root Locus with Integral Control')

zeros = zero(C*P_pend)
poles = pole(C*P_pend)

z = [-3 -4];
p = 0;
k = 1;
C = zpk(z,p,k);
rlocus(C*P_pend)
title('Root Locus with PID Controller')

K = 20;
T = feedback(P_pend,K*C);
impulse(T)
title('Response of Pendulum Angle to an Impulse Disturbance under PID Control');

P_cart = (((I+m*l^2)/q)*s^2 - (m*g*l/q))/(s^4 + (b*(I + m*l^2))*s^3/q - ((M + m)*m*g*l)*s^2/q - b*m*g*l*s/q);
T2 = feedback(1,P_pend*C)*P_cart;
t = 0:0.01:8.5;
impulse(T2, t);
title('Response of Cart Position to an Impulse Disturbance under PID Control');

