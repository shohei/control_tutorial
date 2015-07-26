J = 0.01;
b = 0.1;
K = 0.01;
R = 1;
L = 0.5;
s = tf('s');
P_motor = K/((J*s+b)*(L*s+R)+K^2);

bode(P_motor)
grid
title('Bode Plot of the Original Plant')

[mag,phase,w] = bode(P_motor,10)

C = 72;
margin(C*P_motor);

sys_cl = feedback(C*P_motor,1);
t = 0:0.01:10;
step(sys_cl,t), grid
title('Step Response with Proportional Gain = 72')

C = 45*(s + 1)/(s + 0.01);
bode(C)
grid
title('Bode Plot of the Lag Compensator')

sys_cl = feedback(C*P_motor,1);
t = 0:0.01:10;
step(sys_cl,t), grid
title('Step Response with Lag Compensator')

