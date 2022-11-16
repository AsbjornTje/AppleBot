syms q1 q2 q3 q4

%Defining link-lengths. All values [m]
L1 = .04; L2 = .45; L3 = .45; L4 = .45; %L5 = .07;

%Creating zero angle variable
qz = ([0 0 0 0]);

%Connecting the links with the DH-parameters: 
%| theta | d | a | alfa |  
L(1) = Link ( [0 -L1 0 pi/2] );
L(2) = Link ( [0 0 L2 0] );
L(3) = Link ( [0 0 L3 0] );
L(4) = Link ( [0 0 L4 0] );

%Creating an object of the DH-parameters 
DHrobotArm = SerialLink(L);
DHrobotArm.name = 'Hexacopter Arm';

%Attampt to recreate our arm
import ETS3.*
robotArm = Rz('q1')*Tz(-L1)*Ry('q2')*Tx(L2)*Ry('q3')*Tx(L3)*Ry('q4')*Tx(L4);

%robotArm = Rz('q1')*Tz(-L1)*Ry('q2')*Tx(L2)*Ry('q3')*Tx(L3)*Ry('q4')*Tx(L4);

%finding T04. Uncomment 'syms' if you symbloic output  
%syms Q1 Q2 Q3 Q4       
Q1=0; Q2=0; Q3=0; Q4=0;
T01 =trchain ('Tz(-L1)*Rz(Q1)', Q1);
T12 = trchain ('Rx(Q2)*Tx(L2)', Q2);
T23 = trchain ('Rx(Q3)*Tx(L3)', Q3);
T34 = trchain ('Rx(Q4)*Tx(L4)', Q4)

%Checking if T04 is the same as kinematics
T04 = T01*T12*T23*T34
fkinRobotarm = robotArm.fkine(qz)
fkDHrobotArm = DHrobotArm.fkine(qz)

%Plotting both robot arms
figure('Name','DH-Parameters')
DHrobotArm.plot(qz)
figure('Name','Robot Arm')
robotArm.plot(qz)


%robotArm.teach
%DHrobotArm.teach


