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

R = roots(denp)

rlocus(G1)
z=-log(0.05)/sqrt(pi^2+(log(0.05)^2))
sgrid(z,0)

z1=3+3.5i;
z2=3-3.5i;
p1=30;
p2=60;
numc=conv([1 z1],[1 z2]);
denc=conv([1 p1],[1 p2]);
C=tf(numc,denc);

rlocus(C*G1)

axis([-40 10 -30 30])
z=-log(0.05)/sqrt(pi^2+(log(0.05)^2))
sgrid(z,0)

k = 1.0030e+08;
sys_cl=F*feedback(G1,k*C);

t=0:0.01:2;
step(0.1*sys_cl,t)
title('Closed-Loop Response to 0.1-m High Step w/ Notch Filter')

