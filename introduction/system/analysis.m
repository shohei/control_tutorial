%open loop step response
m = 1000;
b = 50;
u = 500;

s = tf('s');
P_cruise = 1/(m*s+b);

step(u*P_cruise)

%Open loop poles/zeros
pzmap(P_cruise)
axis([-1 1 -1 1])

%Open-loop Bode plot
bode(P_cruise)



