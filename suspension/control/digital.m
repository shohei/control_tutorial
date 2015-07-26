m1 = 2500;
m2 = 320;
k1 = 80000;
k2 = 500000;
b1 = 350;
b2 = 15020;

A = [0                 1   0                                              0
    -(b1*b2)/(m1*m2)   0   ((b1/m1)*((b1/m1)+(b1/m2)+(b2/m2)))-(k1/m1)   -(b1/m1)
     b2/m2             0  -((b1/m1)+(b1/m2)+(b2/m2))                      1
     k2/m2             0  -((k1/m1)+(k1/m2)+(k2/m2))                      0];
B = [0                 0
     1/m1              (b1*b2)/(m1*m2)
     0                -(b2/m2)
     (1/m1)+(1/m2)    -(k2/m2)];
C = [0   0   1   0];
D = [0   0];

sys = ss(A,B,C,D);
step(sys*[0;1]*.1,0:0.0001:.005);

T = .0005;
d_sys = c2d(sys,T,'zoh')

Ai = 1;
Bi = T;
Ci = 1;
Di = T/2;
[As,Bs,Cs,Ds]=ssdata(d_sys);
Aa = [As,	zeros(4,1);
      Bi*Cs,	Ai];
Ba = [Bs;
      0,0];
Ca = [Cs,	0];
Da = Ds;

d_sys_int = ss(Aa,Ba,Ca,Da,T);
[Ad,Bd,Cd,Dd] = ssdata(d_sys_int);


sys1 = d_sys_int*[1;0]; %select the first input
[num,den] = tfdata(sys1,'v');
z = roots(num)

p1 = z(1);
p2 = z(2);
p3 = z(3);
p4 = .9992;
p5 = .5;

K=place(Ad,Bd*[1;0],[p1 p2 p3 p4 p5])

d_sys_cl = ss(Ad-Bd*[1;0]*K,Bd,Cd,Dd,T);
step(-.1*d_sys_cl*[0;1],5);

d_sys_cl = ss(Ad-Bd*[1;0]*K,Bd,Cd,Dd,T);
step(-.1*d_sys_cl*[0;1],5);
axis([0 0.1 -.01 .01])

