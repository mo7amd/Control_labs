t = [0:0.01:10];
s = tf('s');
P_pitch = (1.151*s + 0.1774)/(s^3 + 0.739*s^2 + 0.921*s);
step(0.2*P_pitch,t);
axis([0 10 0 0.8]);

sys_cl = feedback(P_pitch,1);
step(0.2*sys_cl);
margin(P_pitch);

K = 10;
alpha = 0.04;
T = 0.52;

C_lead = K*(T*s + 1) / (alpha*T*s + 1);
sys_cl = feedback(C_lead*P_pitch,1);
step(0.2*sys_cl);
stepinfo(sys_cl)