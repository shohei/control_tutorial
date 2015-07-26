J = 0.01;
b = 0.1;
K = 0.01;
R = 1;
L = 0.5;
A = [-b/J   K/J
    -K/L   -R/L];
B = [0
    1/L];
C = [1   0];
D = 0;
sys = ss(A,B,C,D);

sys_order = order(sys)
sys_rank = rank(ctrb(A,B))

p1 = -5 + 1i;
p2 = -5 - 1i;
Kc = place(A,B,[p1 p2])

t = 0:0.01:3;
sys_cl = ss(A-B*Kc,B,C,D);
step(sys_cl,t)
grid
title('Step Response with State-Feedback Controller')

Nbar = rscale(sys,Kc)

t = 0:0.01:10;
step(sys_cl*Nbar,t)
grid
title('Step Response with State-Feedback Controller and Precompensator')

