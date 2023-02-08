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

% ZYX ROLL PITCH & YAW ANGLES
% ROTATION MATRIX ZYX AND ROLL, PTICH & YAW ANGLES FROM A ROTATION MATRIX

function [RotZYX, RotZYX_d, RollPitchYaw] = Roll_Pitch_Yaw
% Usage:
%   Call functions as (e.g.): 
%   [RotZYX, RotZYX_d, RollPitchYaw] = Roll_Pitch_Yaw
%   RotZYX(phi_r,phi_p,phi_y)

RotZYX = @Rot_zyx;
RotZYX_d = @Rot_zyx_d;
RollPitchYaw = @RPY_angles;

end

function [R_zyx] = Rot_zyx(phi_r,phi_p,phi_y)
% Generate the rotation matrix ZYZ
%   phi_r: Roll angle in radians
%   phi_p: Pitch angle in radians
%   phi_y: Yaw angle in radians
%   R_zyz: rotation matrix ZYZ

    [Rotx, Roty, Rotz, ~, ~, ~] = Rot_Matrix
    R_zyx = Rotz(phi_r)*Roty(phi_p)*Rotx(phi_y)

end

function [R_zyx] = Rot_zyx_d(phi_r,phi_p,phi_y)
% Generate the rotation matrix ZYZ
%   phi_r: Roll angle in degrees
%   phi_p: Pitch angle in degrees
%   phi_y: Yaw angle in degrees
%   R_zyz: rotation matrix ZYZ

    [~, ~, ~, Rotx_d, Roty_d, Rotz_d] = Rot_Matrix
    R_zyx = Rotz_d(phi_r)*Roty_d(phi_p)*Rotx_d(phi_y)
    
end

function [roll1,pitch1,yaw1,roll2,pitch2,yaw2] = RPY_angles(R)
% Returns the Roll, Pitch & Yaw angles from a rotation matrix
% {angle_name}1 is the result using the positive square root in pitch
% {angle_name}2 is the result using the negative square root in pitch
%   roll1: angle in radians
%   pitch1: angle in radians
%   yaw1: angle in radians
%   roll2: angle in radians
%   pitch2: angle in radians
%   yaw2: angle in radians

    [nrows,ncols] = size(R);
    if nrows ~= 3 && ncols ~=3
        error('rotation matrix should be of size (3,3)')
    end
    
    pitch1 = atan2(-R(3,1),sqrt(R(3,2)^2+R(3,3)^2));
    pitch2 = atan2(-R(3,1),-sqrt(R(3,2)^2+R(3,3)^2));
    
    roll1 = atan2(R(2,1)/cos(pitch1),R(1,1)/cos(pitch1));
    roll2 = atan2(R(2,1)/cos(pitch2),R(1,1)/cos(pitch2));
    
    yaw1 = atan2(R(3,2)/cos(pitch1),R(3,3)/cos(pitch1));
    yaw2 = atan2(R(3,2)/cos(pitch2),R(3,3)/cos(pitch2));
end
