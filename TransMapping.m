% from {B} to {C} 
Cxyz = [0.24 0 0.7];
Crot = rotx(-pi/2);
Ctrn = rt2tr(Crot, Cxyz);

% from {C} to {F} 
Fxyz = [.3 0.4 -.5];
Ftrn = rt2tr(eye(3), Fxyz);

% from {B} to {C}
B2C = Ctrn*Ftrn;

%finding our kinematics
T = rt2tr(roty(pi*(3/4)),[B2C(1,4) B2C(2,4) B2C(3,4)]);
% "-0.2" og "0.4" er offset som gjør at vi ikke f.eks spyler inni potten
% q = ur5.ikine(T,[qr], [1 1 1 0 1 0])

%tg = jtraj(qz, qf, 50);

%base frame 
hold on
trplot(eye(3),'color','r')
%camera frame
trplot(Ctrn,'color','b')
%fruit frame
trplot(Ftrn,'color','g')
%robotArm.plot(tg)

grid on
