M = 0.5;
m = 0.2;
b = 0.1;
I = 0.006;
g = 9.8;
l = 0.3;
q = (M+m)*(I+m*l^2)-(m*l)^2;
s = tf('s');
P_pend = (m*l*s/q)/(s^3 + (b*(I + m*l^2))*s^2/q - ((M + m)*m*g*l)*s/q - b*m*g*l/q);

[zeros poles] = zpkdata(P_pend,'v')

         sisotool('bode',P_pend)

   sisotool('bode',P_pend*(1/s))
      

K = 10;
C = K*(s+1)^2/s;
T = feedback(P_pend,C);
t = 0:0.01:10;
impulse(T,t), grid
title('Response of Pendulum Position to an Impulse Disturbance under Closed-loop Control');

K = 35;
C = K*(s+1)*(s+2)/s;
T = feedback(P_pend,C);
t = 0:0.01:10;
impulse(T, t), grid
title('Response of Pendulum Position to an Impulse Disturbance under Closed-loop Control');

P_cart = (((I+m*l^2)/q)*s^2 - (m*g*l/q))/(s^4 + (b*(I + m*l^2))*s^3/q - ((M + m)*m*g*l)*s^2/q - b*m*g*l*s/q);
T2 = feedback(1,P_pend*C)*P_cart;
T2 = minreal(T2);
t = 0:0.01:10;
impulse(T2, t), grid
title('Response of Cart Position to an Impulse Disturbance under Closed-loop Control');

