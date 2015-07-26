m = 1000;
b = 50;
u = 500;

Kp = 1;
s = tf('s');
P_cruise = 1/(m*s+b);
C = Kp;
step(u*C*P_cruise)

bode(C*P_cruise);


r = 10;
sys_cl = feedback(C*P_cruise,1);
step(r*sys_cl);
Kp = 2500;
C = Kp;

bode(C*P_cruise);
sys_cl = feedback(C*P_cruise,1);
step(r*sys_cl);

Kp = 1000;
zo = 0.1;
po = 0.02;

C_lag = (s+zo)/(s+po);
bode(Kp*C_lag*P_cruise);

sys_cl = feedback(Kp*C_lag*P_cruise,1);
t = 0:0.1:20;
step(r*sys_cl,t);

