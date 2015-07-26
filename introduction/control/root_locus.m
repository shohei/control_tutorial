s = tf('s');
sys = (s + 7)/(s*(s + 5)*(s + 15)*(s + 20));
rlocus(sys)
axis([-22 3 -15 15])

Zeta = 0.7;
Wn = 1.8;
sgrid(Zeta,Wn)

K = 350;
sys_cl = feedback(K*sys,1)

step(sys_cl)

s = tf('s');
plant = (s + 7)/(s*(s + 5)*(s + 15)*(s + 20));



