M = 0.5;
m = 0.2;
b = 0.1;
I = 0.006;
g = 9.8;
l = 0.3;
q = (M+m)*(I+m*l^2)-(m*l)^2;
s = tf('s');
P_pend = (m*l*s/q)/(s^3 + (b*(I + m*l^2))*s^2/q - ((M + m)*m*g*l)*s/q - b*m*g*l/q);

z = [-3 -4];
p = 0;
k = 1;

C = zpk(z,p,k);

figure
rlocus(C*P_pend)
[K,poles] = rlocfind(C*P_pend);

sys_cl = feedback(P_pend,K*C);
figure
impulse(sys_cl)
