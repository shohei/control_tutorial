J = 3.2284E-6;
b = 3.5077E-6;
K = 0.0274;
R = 4;
L = 2.75E-6;
s = tf('s');
P_motor = K/(s*((J*s+b)*(L*s+R)+K^2));
zpk(P_motor)

Ts = 0.001;
dP_motor = c2d(P_motor, Ts, 'zoh');
zpk(dP_motor)

dP_motor = minreal(dP_motor,0.001);
zpk(dP_motor)

sys_cl = feedback(dP_motor,1);
[x1,t] = step(sys_cl,.5);
stairs(t,x1)
xlabel('Time (seconds)')
ylabel('Position (radians)')
title('Stairstep Response: Original')
grid

dist_cl = feedback(dP_motor,C);
         [x2,t] = step(dist_cl,.25);
         stairs(t,x2)
         xlabel('Time (seconds)')
         ylabel('Position (rad)')
         title('Stairstep Disturbance Response with Compensation')
         grid
         

