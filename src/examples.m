%% Math4Robots - Examples
% Mathematical models are a powerful tool for representing geometric and
% dynamic aspects of robots. In this file you will see some examples of how
% the functions implemented in this toolbox can be used for robot modeling.

%% Cartesian, cylindrical and spherical coordinates
% You can convert points from one coordinate system to another.
% e.g. Convert the point (2,3,6) in the cartesian coordinate to the
% cylindrical.
clear all
x = 2; 
y = 3; 
z = 6;
[car2cyl, car2sph, cyl2car, cyl2sph, sph2car, sph2cyl] = Change_CS;
[rho, theta_c, z] = car2cyl(x,y,z);
rho, theta_c, z

%% Rotation matrices
% To generate a 3x3 rotation matrix you can call the functions from 
% Rot_Matrix.
% Recall that the rotation matrices along the x, y and z axis are:
% $$ R_x = \pmatrix{1 & 0 & 0 \cr 0 & cos(\theta) & -sin(\theta) \cr 0 &
% sin(\theta) & cos(\theta) } $$, $$ R_y = \pmatrix{cos(\theta) & 0 &
% sin(\theta) \cr 0 & 1 & 0 \cr -sin(\theta) & 0 & cos(\theta) } $$ and $$
% R_z = \pmatrix{cos(\theta) & -sin(\theta) & 0 \cr sin(\theta) &
% cos(\theta) & 0 \cr 0 & 0 & 1 } $$.
% e.g. Generate a rotation matrix that corresponds to a rotation of 90°
% around the x axis and another that corresponds to -45° in the z axis.
% You can input the angle in radians and in degrees (functions with suffix
% _d).
[Rotx, Roty, Rotz, Rotx_d, Roty_d, Rotz_d] = Rot_Matrix;
[Rx] = Rotx(pi/2)
[Rz] = Rotz_d(-45)

%% 3D Rotation group SO(3)
% To check wether a matrix belongs to the SO(3) group you can use the
% function is_SO(3). Recall that: $$ SO(3) = {R \in R^{3x3}: RR^T = 1, 
% det R = +1} $$ e.g. Check if a rotation matrix actually belongs to the
% SO(3) group
R = Rotx(pi)*Roty(-pi/4)*Rotz(pi/2)
is_SO3(R)
%e.g. matrix that does not belong to the rotation group SO(3)
M = eye(3) + 1
is_SO3(M)

%% Skew-Symmetric matrix
% This function Generates a skew-symmetric matrix from an angular velocity
% vector $$\omega = \pmatrix{\omega_x \cr \omega_y \cr \omega_z} $$. Recall
% that the skew-symmetric matrix will have the form: 
% $$ \hat{\omega} = \pmatrix{0 & -\omega_z & \omega_y \cr \omega_z & 0 & 
% -\omega_x \cr -\omega_y & \omega_x & 0} $$
% e.g.
w = [4; 3; -2]; 
w_hat = Skew_Symmetric(w);

%% Matrix exponential
% It generates the solution of the time derivative of rotation matrices.
% i.e. $$ e^{\hat{\omega}t} = I \frac{\hat{\omega}}{|\!|\omega|\!|} 
% sin(|\!| \omega |\!| t) + \frac{\hat{\omega}^2}{|\!|\omega|\!|^2}
% (1-cos(|\!| \omega |\!|t)) $$
syms t
e = @(t) Matrix_Exp(w, w_hat,t)
fplot(e(t),[0 10])
title('Matrix exponential')
xlabel('e^{wt}') 
ylabel('t')
% We can subtitute e.g. t = 1
t = 1
subs(e)

%% Rodigues rotation formula
% Computes a rotation matrix given an axis and an angle of rotation using
% the Rodigues rotation formula. e.g.
w = [4; 3; -2]; 
theta = pi;
[RodriguesRT, RodriguesRT_d] = Rodrigues_Formula
[e] = RodriguesRT(w, theta);

%% Euler angles
% Generate the rotation matrix ZYZ given the angles $$ \phi, \theta\ $$ and
% $$ \psi $$. As well as return the same angles given an Euler rotation
% matrix. e.g.

phi = pi; 
theta = -pi/2;
psi = pi/4;

[RotZYZ, RotZYZ_d, EulerAngles] = Euler_Angles;
[R_zyz] = RotZYZ(phi,theta,psi);

R = Rotz(pi/2)*Roty(-pi/4)*Rotz(pi)
[phi1,theta1,psi1,phi2,theta2,psi2] = EulerAngles(R)

%% Roll, Pitch and Yaw angles
% With these functions you can generate a rotation matrix ZYX. As well as
% get the Roll, Pitch and Yaw angles from a rotation matrix. e.g

phi_r = pi; 
phi_p = -pi/2;
phi_y = pi/4;

[RotZYX, RotZYX_d, RollPitchYaw] = Roll_Pitch_Yaw;
[R_zyx] = RotZYX(phi_r,phi_p,phi_y)

R = Rotz(pi/2)*Roty(-pi/4)*Rotx(pi)
[roll1,pitch1,yaw1,roll2,pitch2,yaw2] = RollPitchYaw(R)

%% Homogeneous transformation matrix
% With these functions you can generate translation, rotation and
% homogeneous transformation matrices. Recall that a rotation matrix is a 4
% by 4 matrix with the form: $$ HT = \pmatrix{ R & T \cr 0 & 1} $$.
% You can use either the radian's or degree's version. e.g.
[Trans, Rotxg, Rotyg, Rotzg, Rotxg_d, Rotyg_d, Rotzg_d] = Hom_Transform;
T = Trans([4; 2; -5])
R = Rotxg(pi/4)*Rotxg_d(45)
HT = T*R

%% Denavit-Hartenberg
% It generates a homogeneous transformation matrix using the
% Denavit-Hartenberg parameters $$ d, \theta, a $$ and $$ \alpha $$ as an
% input. e.g.
d = 1;
theta = pi;
a = -3;
alpha = -pi/2
Denavit_Hartenberg(d, theta, a, alpha)

%% Inverse Kinematics - Newton-Raphson method
% You can find the joint variables from a certain position in the cartesian
% space using the Newton-Rapshon method. That is, you can use the
% Newton-Raphson method as the numerical approach for inverse kinematics.
% Recall than the Newton-Raphson method is given by:
% $$ x_{k+1} = x_k - \frac{f(x_k)}{f'(x_k)} $$.
% In inverse kinematics this has the form:
% $$ q_{k+1} = q_k + J^{-1} (q_k) (x_d - f(q)) $$.
% e.g. For a RR manipulator with 2 degrees of freedom.
syms q1 q2 q3
l1 = 1; l2 = 1; l3 = 1;

F = [l1*cos(q1) + l2*cos(q1+q2);
     l1*sin(q1) + l2*sin(q1+q2)];
 
x_d = [1.2; 1.2];
q = [1; -1];
epsilon = 1e-3;
max_iter = 5;
verify = true;

[Qvalues] = InverseK_Newton(F,x_d, q, epsilon, max_iter, verify)

InverseK_Newton(F,x_d, q, epsilon, max_iter, verify);
