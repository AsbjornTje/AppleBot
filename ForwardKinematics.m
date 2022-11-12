syms q1 q2 q3 q4

%Defining link-lengths. All values [mm]
L1 = 200; L2 = 250; L3 = 450; L4 = 100; 

%Connecting the links with the DH-parameters: 
% | theta | d | a | alfa |  
L(1) = Link ( [0 -L1 0 pi/2] );
L(2) = Link ( [0 0 L2 0] );
L(3) = Link ( [0 0 L3 0] );
L(4) = Link ( [0 0 L4 0] );

%Creating an object of the DH-parameters 
robotArm = SerialLink(L);
robotArm.name = 'Hexacopter Arm';

%Creating zero angle variable
qz = ([0 0 0 0]);

%Attampt to recreate our arm
import ETS3.*
attamptArm = Rz('q1')*Tz(-L1)*Ry('q2')*Tx(L2)*Ry('q3')*Tx(L3)*Ry('q4')*Tx(L4);

%Plotting both robot arms
figure('Name','DH-Parameters')
robotArm.plot(qz)
figure('Name','Attampt arm')
attamptArm.plot(qz)


