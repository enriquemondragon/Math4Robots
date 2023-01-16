% ZYX ROLL PITCH & YAW ANGLES
% ROTATION MATRIX ZYX AND ROLL, PTICH & YAW ANGLES FROM A ROTATION MATRIX

function [R_zyx] = Rot_zyx(phi_r,phi_p,phi_y)
% Generate the rotation matrix ZYZ
%   phi_r: Roll angle in radians
%   phi_p: Pitch angle in radians
%   phi_y: Yaw angle in radians
%   R_zyz: rotation matrix ZYZ
    R_zyx = Rot_z(phi_r)*Rot_y(phi_p)*Rot_x(phi_y)
    
    function [Rx] = Rot_x(theta)
    % Rotation matrix around x-axis
    %   theta: angle in radians
        Rx = [1 0 0; 0 cos(theta) -sin(theta); 0 sin(theta) cos(theta)]; 
    end

    function [Ry] = Rot_y(theta)
    % Rotation matrix around y-axis
    %   theta: angle in radians
        Ry = [cos(theta) 0 sin(theta); 0 1 0; -sin(theta) 0 cos(theta)]; 
    end

    function [Rz] = Rot_z(theta)
    % Rotation matrix around z-axis
    %   theta: angle in radians
        Rz = [cos(theta) -sin(theta) 0; sin(theta) cos(theta) 0; 0 0 1]; 
    end
end

function [R_zyx] = Rot_zyx_d(phi_r,phi_p,phi_y)
% Generate the rotation matrix ZYZ
%   phi_r: Roll angle in degrees
%   phi_p: Pitch angle in degrees
%   phi_y: Yaw angle in degrees
%   R_zyz: rotation matrix ZYZ
    phi_r = deg2rad(phi_r)
    phi_p = deg2rad(phi_p)
    phi_y = deg2rad(phi_y)
    R_zyx = Rot_z(phi_r)*Rot_y(phi_p)*Rot_x(phi_y)
    
    function [Rx] = Rot_x(theta)
    % Rotation matrix around x-axis
    %   theta: angle in radians
        Rx = [1 0 0; 0 cos(theta) -sin(theta); 0 sin(theta) cos(theta)]; 
    end

    function [Ry] = Rot_y(theta)
    % Rotation matrix around y-axis
    %   theta: angle in radians
        Ry = [cos(theta) 0 sin(theta); 0 1 0; -sin(theta) 0 cos(theta)]; 
    end

    function [Rz] = Rot_z(theta)
    % Rotation matrix around z-axis
    %   theta: angle in radians
        Rz = [cos(theta) -sin(theta) 0; sin(theta) cos(theta) 0; 0 0 1]; 
    end
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
