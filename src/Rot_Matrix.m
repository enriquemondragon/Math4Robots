% ROTATION MATRICES
% 3 X 3 ROTATION MATRICES 

function [Rotx, Roty, Rotz, Rotx_d, Roty_d, Rotz_d] = Rot_Matrix
% Uasage:
%   Call functions as (e.g.): 
%   [Rotx, Roty, Rotz, Rotx_d, Roty_d, Rotz_d] = Rot_Matrix
%   Rotx(theta)

Rotx = @Rot_x;
Roty = @Rot_y;
Rotz = @Rot_z;
Rotx_d = @Rot_x_d;
Roty_d = @Rot_y_d;
Rotz_d = @Rot_z_d;
end

% FUNCTIONS OF ROTATION MATRICES - RADIANS
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


% FUNCTIONS OF ROTATION MATRICES - DEGREES
function [Rx] = Rot_x_d(theta)
% Rotation matrix around x-axis
%   theta: angle in degrees
    theta = deg2rad(theta)
    Rx = [1 0 0; 0 cos(theta) -sin(theta); 0 sin(theta) cos(theta)]; 
end

function [Ry] = Rot_y_d(theta)
% Rotation matrix around y-axis
%   theta: angle in degrees
    theta = deg2rad(theta)
    Ry = [cos(theta) 0 sin(theta); 0 1 0; -sin(theta) 0 cos(theta)]; 
end

function [Rz] = Rot_z_d(theta)
% Rotation matrix around z-axis
%   theta: angle in degrees
    theta = deg2rad(theta)
    Rz = [cos(theta) -sin(theta) 0; sin(theta) cos(theta) 0; 0 0 1]; 
end
