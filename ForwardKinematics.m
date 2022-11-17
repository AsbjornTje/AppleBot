syms q1 q2 q3 q4

%Defining link-lengths. All values [m]
L1 = .04; L2 = .45; L3 = .45; L4 = .45; L5 = .07;

%Creating zero angle variable
qz = ([0 0 0 0]);
qf1 = ([1.5 2.4 1.2 0.7])
qf2 = ([0.65 1.39 -1.39 -0.77])

%Attampt to recreate our arm
import ETS3.*
robotArm = Rz('q1')*Tz(-L1)*Ry('q2')*Tx(L2)*Ry('q3')*Tx(L3)*Ry('q4')*Tx(L4);

%robotArm = Rz('q1')*Tz(-L1)*Ry('q2')*Tx(L2)*Ry('q3')*Tx(L3)*Ry('q4')*Tx(L4);

%finding T04. Uncomment 'syms' if you symbloic output  
%syms Q1 Q2 Q3 Q4       
Q1=0; Q2=0; Q3=0; Q4=0;
T01 = trchain ('Tz(-L1)*Rz(Q1)', Q1);
T12 = trchain ('Rx(Q2)*Tx(L2)', Q2);
T23 = trchain ('Rx(Q3)*Tx(L3)', Q3);
T34 = trchain ('Rx(Q4)*Tx(L4)', Q4);

%Checking if T04 is the same as kinematics
T04 = T01*T12*T23*T34
fkinRobotarm = robotArm.fkine(qz)

%Plotting arm
figure('Name','Robot Arm')
robotArm.plot(qz)

%robotArm.teach

%Making trajectery 
tg = jtraj(qf1,qf2, 50);



robotArm.plot(tg)
%-------------------Ploting frames------------------%
%    {B} => Base; {C} => Camera; {F} => Fruit

% from {B} to {C} 
Cxyz = [0.24 0 0.7];
Crot = rotx(-pi/2);
Ctrn = rt2tr(Crot, Cxyz);

% from {C} to {F} 
Fxyz = [.7 .5 -.2];
Ftrn = rt2tr(eye(3), Fxyz);

% from {B} to {C}
B2C = Ctrn*Ftrn;

%base frame 
hold on
trplot(eye(3),'color','r')
%camera frame
trplot(Ctrn,'color','b')
%fruit frame
trplot(Ftrn,'color','g')

%animating our arm
robotArm.plot(tg)
grid on







