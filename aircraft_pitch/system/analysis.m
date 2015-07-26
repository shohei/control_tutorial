s = tf('s');
P_pitch = (1.151*s+0.1774)/(s^3+0.739*s^2+0.921*s);
t = [0:0.01:10];
step(0.2*P_pitch,t);
axis([0 10 0 0.8]);
ylabel('pitch angle (rad)');
title('Open-loop Step Response');

pole(P_pitch)

sys_cl = feedback(P_pitch,1)

  step(0.2*sys_cl);
         ylabel('pitch angle (rad)');
         title('Closed-loop Step Response');

poles = pole(sys_cl)
zeros = zero(sys_cl)

R = 0.2/s;
Y = zpk(sys_cl*R)

[r,p,k] = residue(0.2*[1.151 0.1774],[1 0.739 2.072 0.1774 0])

[num,den] = residue(r(1:2),p(1:2),k);
tf(num,den)

t = [0:0.1:70];
y = 0.2 - 0.0881*exp(-0.08805*t) - exp(-0.3255*t).*(0.1121*cos(1.3816*t)+0.0320*sin(1.3816*t));
plot(t,y)
xlabel('time (sec)');
ylabel('pitch angle (rad)');
title('Closed-loop Step Response');

