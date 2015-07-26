A = [-0.313 	56.7 	0;
     -0.0139   -0.426 	0;
      0 	56.7 	0];
B = [0.232;
     0.0203;
     0];
C = [0 0 1];
D = [0];

sys_ss = ss(A,B,C,D);

Ts = 1/100;
sys_d = c2d(sys_ss,Ts,'zoh')



co = ctrb(sys_d);
Controllability = rank(co)
A = sys_d.a;
B = sys_d.b;
C = sys_d.c;
D = sys_d.d;
p = 50;
Q = p*C'*C
R = 1;
[K] = dlqr(A,B,Q,R)

time = 0:0.01:10;
theta_des = 0.2*ones(size(time));
sys_cl = ss(A-B*K,B,C,D,Ts);
[y,t] = lsim(sys_cl,theta_des);
stairs(t,y)
xlabel('time (sec)');
ylabel('pitch angle (rad)');
title('Closed-Loop Step Response: DLQR');

Nbar = 6.95;
sys_cl = ss(A-B*K,B*Nbar,C,D,Ts);
[y,t] = lsim(sys_cl,theta_des);
stairs(t,y)
xlabel('time (sec)');
ylabel('pitch angle (rad)');
title('Closed-Loop Step Response: DLQR with Precompensation');

