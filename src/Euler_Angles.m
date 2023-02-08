% Copyright (c) 2023 Enrique Mondragon Estrada
% 
% Permission is hereby granted, free of charge, to any person obtaining a copy
% of this software and associated documentation files (the "Software"), to deal
% in the Software without restriction, including without limitation the rights
% to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
% copies of the Software, and to permit persons to whom the Software is
% furnished to do so, subject to the following conditions:
% 
% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
% IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
% FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
% AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
% LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
% OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
% SOFTWARE.

% ZYZ-EULER ANGLE TRANSFORMATION
% ROTATION MATRIX ZYZ AND EULER ANGLES FROM A ROTATION MATRIX

function [RotZYZ, RotZYZ_d, EulerAngles] = Euler_Angles
% Usage:
%   Call functions as (e.g.): 
%   [RotZYZ, RotZYZ_d, EulerAngles] = Euler_Angles
%   RotZYZ(phi,theta,psi)

RotZYZ = @Rot_zyz;
RotZYZ_d = @Rot_zyz_d;
EulerAngles = @euler_ang;

end

function [R_zyz] = Rot_zyz(phi,theta,psi)
% Generate the rotation matrix ZYZ
%   phi: angle in radians
%   theta: angle in radians
%   psi: angle in radians
%   R_zyz: rotation matrix ZYZ

    [~, Roty, Rotz, ~, ~, ~] = Rot_Matrix
    R_zyz = Rotz(phi)*Roty(theta)*Rotz(psi)
  
end

function [R_zyz] = Rot_zyz_d(phi,theta,psi)
% Generate the rotation matrix ZYZ
%   phi: angle in degrees
%   theta: angle in degrees
%   psi: angle in degrees
%   R_zyz: rotation matrix ZYZ

    [~, ~, ~, ~, Roty_d, Rotz_d] = Rot_Matrix
    R_zyz = Rotz_d(phi)*Roty_d(theta)*Rotz_d(psi)
    
end

function [phi1,theta1,psi1,phi2,theta2,psi2] = euler_ang(R)
% Returns the Euler angles from an Euler rotation matrix
% {angle_name}1 is the result using the positive square root in theta
% {angle_name}2 is the result using the negative square root in theta
%   phi1: angle in radians
%   theta1: angle in radians
%   psi1: angle in radians
%   phi2: angle in radians
%   theta2: angle in radians
%   psi2: angle in radians

    [nrows,ncols] = size(R);
    if nrows ~= 3 && ncols ~=3
        error('Euler rotation matrix should be of size (3,3)')
    end
    
    theta1 = atan2(sqrt(R(1,3)^2+R(2,3)^2),R(3,3));
    theta2 = atan2(-sqrt(R(1,3)^2+R(2,3)^2),R(3,3)); 
    
    phi1 = atan2(R(2,3)/sin(theta1),R(1,3)/sin(theta1));
    phi2 = atan2(R(2,3)/sin(theta2),R(1,3)/sin(theta2));
    
    psi1 = atan2(R(3,2)/sin(theta1),-R(3,1)/sin(theta1));
    psi2 = atan2(R(3,2)/sin(theta2),-R(3,1)/sin(theta2));
    
end
