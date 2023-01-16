% ZYZ-EULER ANGLE TRANSFORMATION
% ROTATION MATRIX ZYZ AND EULER ANGLES FROM A ROTATION MATRIX

function [R_zyz] = Rot_zyz(phi,theta,psi)
% Generate the rotation matrix ZYZ
%   phi: angle in radians
%   theta: angle in radians
%   psi: angle in radians
%   R_zyz: rotation matrix ZYZ
    R_zyz = Rot_z(phi)*Rot_y(theta)*Rot_z(psi)
    
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

function [R_zyz] = Rot_zyz_d(phi,theta,psi)
% Generate the rotation matrix ZYZ
%   phi: angle in degrees
%   theta: angle in degrees
%   psi: angle in degrees
%   R_zyz: rotation matrix ZYZ
    phi = deg2rad(phi)
    theta = deg2rad(theta)
    psi = deg2rad(psi)
    R_zyz = Rot_z(phi)*Rot_y(theta)*Rot_z(psi)
    
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

function [phi1,theta1,psi1,phi2,theta2,psi2] = Euler_angles(R)
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
