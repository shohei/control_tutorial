m = 1000;
b = 50;
t = 0:0.1:10;
u = 500*ones(size(t));

A = [-b/m];
B = [1/m];
C = [1];
D = [0];
sys = ss(A,B,C,D);

x0 = [0];

p1 = -1.5;

K = place(A,B,[p1])

sys_cl = ss(A-B*K,B,C,D);
lsim(sys_cl,u,t,x0);
axis([0 10 0 0.35])

Nbar = rscale(sys,K)*10/500;
sys_cl = ss(A-B*K,B*Nbar,C,D);

lsim(sys_cl,u,t,x0);
axis([0 10 0 11])

