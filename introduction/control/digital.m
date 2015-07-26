M = 1;
b = 10;
k = 20;

s = tf('s');
sys = 1/(M*s^2+b*s+k);

Ts = 1/100;
sys_d = c2d(sys,Ts,'zoh')

A = [0       1;
    -k/M   -b/M];

B = [  0;
    1/M];

C = [1 0];

D = [0];

Ts = 1/100;

sys = ss(A,B,C,D);
sys_d = c2d(sys,Ts,'zoh')

numDz = 1;
denDz = [1 -0.3 0.5];
sys = tf(numDz,denDz,-1); % the -1 indicates that the sample time is undetermined

pzmap(sys)
axis([-1 1 -1 1])
zgrid

sys = tf(numDz,denDz,1/20);
step(sys,2.5);

numDz = [1 -0.3];
denDz = [1 -1.6 0.7];
sys = tf(numDz,denDz,-1);

rlocus(sys)
axis([-1 1 -1 1])

zeta = 0.4;
Wn = 0.3;
zgrid(zeta,Wn)

