function lab4
m = 0.111;
R = 0.015;
g = -9.8;
J = 9.99e-6;

H = -m*g/(J/(R^2)+m);

A = [0 1 0 0
     0 0 H 0
     0 0 0 1
     0 0 0 0];
B = [0;0;0;1];
C = [1 0 0 0];
D = [0];

ball_ss = ss(A,B,C,D);
% ********************************************************
p1 = -2+2i;
p2 = -2-2i;
p3 = -20;
p4 = -80;

K = place(A,B,[p1,p2,p3,p4]);

t = 0:0.01:5;
u = 0.25*ones(size(t));
sys_cl = ss(A-B*K,B,C,D);
[y,t,x] = lsim(sys_cl,u,t);
subplot(2,1,1);
plot(t,y); % system here with large steady state error 
% ************************************************************
Nbar=rscale(ball_ss,K);
t = 0:0.01:5;
u = 0.25*ones(size(t));
[y,t,x]=lsim(Nbar*sys_cl,u,t);
subplot(2,1,2);
plot(t,y) % system here with good steady state error

end