s = tf('s');
sys = 50/(s^3 + 9*s^2 + 30*s +40);

bode(sys)
grid on
title('Bode Plot with No Gain')

bode(100*sys)
grid on
title('Bode Plot with Gain = 100')

margin(100*sys)

sys = 1/(s^2 + 0.5*s + 1);
bode(sys)

sys = 1/(s^2 + 0.5*s + 1);
w = 0.3;
t = 0:0.1:100;
u = sin(w*t);
[y,t] = lsim(sys,u,t);
plot(t,y,t,u)
axis([50 100 -2 2])

sys = 1/(s^2 + 0.5*s + 1);
w = 3;
t = 0:0.1:100;
u = sin(w*t);
[y,t] = lsim(sys,u,t);
plot(t,y,t,u)
axis([90 100 -1 1])

s = tf('s');
sys = 0.5/(s - 0.5);
nyquist(sys)
axis([-1 0 -1 1])

sys = (s + 2)/(s^2);
nyquist(sys)

nyquist1(sys)

lnyquist(sys)

sys = 10/(1.25*s + 1);
bode(sys)

sys_cl = feedback(sys,1);
step(sys_cl)
title('Closed-Loop Step Response, No Controller')

plant = 10/(1.25*s + 1);
contr = 1/s;
bode(contr*plant, logspace(0,2))

plant = 10/(1.25*s + 1);
contr = (s + 1)/s;
bode(contr*plant, logspace(0,2))

plant = 10/(1.25*s + 1);
contr = 5 * ((s + 1)/s);
bode(contr*plant, logspace(0,2))

sys_cl = feedback(contr*plant,1);
step(sys_cl)

roots([1 -8 15])

sys = (s^2 + 10*s + 24)/(s^2 - 8*s + 15);
nyquist(sys)

nyquist(20*sys)

nyquist(0.5*sys)

sys = 50/(s^3 + 9*s^2 + 30*s + 20);
nyquist(sys)

w = sqrt(30);
polyval(50,j*w)/polyval([1 9 30 40],j*w)

a = 4.6;
nyquist(a*sys)

