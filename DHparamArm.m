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

%plotting our arm
DHrobotArm.plot(qz)
qArm = DHparamArm.ikine(B2C,'mask',[1 1 1 0 0 1]) 


