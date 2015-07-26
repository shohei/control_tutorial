J = 3.2284E-6;
b = 3.5077E-6;
K = 0.0274;
R = 4;
L = 2.75E-6;
s = tf('s');
P_motor = K/(s*((J*s+b)*(L*s+R)+K^2));

t = 0:0.001:0.2;
step(P_motor,t)

isstable(P_motor)

pole(P_motor)

sys_cl = feedback(P_motor,1)

step(sys_cl,t)

pzmap(sys_cl)
         

damp(sys_cl)
[Wn,zeta,poles] = damp(sys_cl);
OS = exp((-zeta(1)*pi)/sqrt(1-zeta(1)^2))
Ts = 4/(zeta(1)*Wn(1))

