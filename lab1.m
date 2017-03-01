% lab 1 control system 
% motor position control using PID controller 
J = 3.2284E-6;
b = 3.5077E-6;
K = 0.0274;
R = 4;
L = 2.75E-6;
% ****************************************************
s = tf('s');
P_motor = K/(s*((J*s+b)*(L*s+R)+K^2));
% *******************Part one with error**************
t = 0:0.001:0.2;
step(P_motor,t);
% ******************enter closed loop ****************
sys_cl = feedback(P_motor,1);
step(sys_cl,t);
% *******************PID constansts ******************
Kp = 21;
Ki = 500;
Kd = 0.15;
% ****************************************************
C = Kp + Ki/s + Kd*s;
sys_cl = feedback(C*P_motor,1);
step(sys_cl);
% ****************************************************
stepinfo(sys_cl)