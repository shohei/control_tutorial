J = 0.01;
b = 0.1;
K = 0.01;
R = 1;
L = 0.5;
s = tf('s');
P_motor = K/((J*s+b)*(L*s+R)+K^2);
zpk(P_motor)

Ts = 0.05;
dP_motor = c2d(P_motor,Ts,'zoh');
zpk(dP_motor)

sys_cl = feedback(dP_motor,1);
[y,t] = step(sys_cl,12);
stairs(t,y);
xlabel('Time (s)')
ylabel('Velocity (rad/s)')
title('Stairstep Response: Original')

Kp = 100;
Ki = 200;
Kd = 10;

C = Kp + Ki/s + Kd*s;
dC = c2d(C,Ts,'tustin')

sys_cl = feedback(dC*dP_motor,1);
[x2,t] = step(sys_cl,12);
stairs(t,x2)
xlabel('Time (seconds)')
ylabel('Velocity (rad/s)')
title('Stairstep Response: with PID controller')

rlocus(dC*dP_motor)
axis([-1.5 1.5 -1 1])
title('Root Locus of Compensated System')

z = tf('z',Ts);
dC = dC/(z+0.82);
rlocus(dC*dP_motor);
axis([-1.5 1.5 -1 1])
title('Root Locus of Compensated System');

sys_cl = feedback(0.8*dC*dP_motor,1);
[x3,t] = step(sys_cl,8);
stairs(t,x3)
xlabel('Time (seconds)')
ylabel('Velocity (rad/s)')
title('Stairstep Response: with Modified PID controller')

