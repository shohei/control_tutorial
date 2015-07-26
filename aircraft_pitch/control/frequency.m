t = [0:0.01:10];
s = tf('s');
P_pitch = (1.151*s + 0.1774)/(s^3 + 0.739*s^2 + 0.921*s);
step(0.2*P_pitch,t);
axis([0 10 0 0.8]);
ylabel('pitch angle (rad)');
title('Open-loop Step Response');
grid

sys_cl = feedback(P_pitch,1)
pole(sys_cl)

margin(P_pitch), grid

sys_cl = feedback(P_pitch,1);
step(0.2*sys_cl), grid
ylabel('pitch angle (rad)');
title('Closed-loop Step Response')

K = 10;
margin(K*P_pitch), grid
figure;
sys_cl = feedback(K*P_pitch,1);
step(0.2*sys_cl), grid
title('Closed-loop Step Response with K = 10')

K = 10;
alpha = 0.10;
T = 0.52;
C_lead = K*(T*s + 1) / (alpha*T*s + 1);
margin(C_lead*P_pitch), grid

sys_cl = feedback(C_lead*P_pitch,1);
step(0.2*sys_cl), grid
title('Closed-loop Step Response with K = 10, alpha = 0.10, and T = 0.52')

stepinfo(0.2*sys_cl)

K = 10;
alpha = 0.04;
T = 0.55;
C_lead = K*(T*s + 1) / (alpha*T*s + 1);
sys_cl = feedback(C_lead*P_pitch,1);
step(0.2*sys_cl), grid
title('Closed-loop Step Response with K = 10, \alpha = 0.04, and T = 0.55')

stepinfo(0.2*sys_cl)

