m1 = 2500;
m2 = 320;
k1 = 80000;
k2 = 500000;
b1 = 350;
b2 = 15020;

nump=[(m1+m2) b2 k2];
denp=[(m1*m2) (m1*(b1+b2))+(m2*b1) (m1*(k1+k2))+(m2*k1)+(b1*b2) (b1*k2)+(b2*k1) k1*k2];
G1=tf(nump,denp);

num1=[-(m1*b2) -(m1*k2) 0 0];
den1=[(m1*m2) (m1*(b1+b2))+(m2*b1) (m1*(k1+k2))+(m2*k1)+(b1*b2) (b1*k2)+(b2*k1) k1*k2];
G2=tf(num1,den1);

numf=num1;
denf=nump;
F=tf(numf,denf);

w = logspace(-1,2);
bode(G1,w)

K=100000;
bode(K*G1,w)

a = (1-sin(70/180*pi))/(1+sin(70/180*pi));
w=5;
T=1/(w*sqrt(a));
aT=sqrt(a)/w;
numc = conv([T 1], [T 1]);
denc = conv([aT 1], [aT 1]);
C = tf(numc,denc);
margin(K*C*G1)

sys_cl = F*feedback(G1,K*C);

t=0:0.01:5;
step(0.1*sys_cl,t)
axis([0 5 -.01 .01])

numc = 4*conv([T 1], [T 1]);
denc = conv([aT 1], [aT 1]);
C = tf(numc,denc);
sys_cl = F*feedback(G1,K*C);
t=0:0.01:5;
step(0.1*sys_cl,t)
axis([0 5 -.01 .01])

