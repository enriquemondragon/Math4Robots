% HOMOGENEOUS TRANSFORMATION
% ROTATION AND TRANSLATION

% HOMOGENEOUS TRANSFORM --> TH = T*R

function [Trans, Rotxg, Rotyg, Rotzg, Rotxg_d, Rotyg_d, Rotzg_d] = Hom_Transform
% Usage:
%   Call functions as (e.g.): 
%   [Trans, Rotxg, Rotyg, Rotzg, Rotxg_d, Rotyg_d, Rotzg_d] = Hom_Transform
%   Trans(t)

Trans = @tras;
Rotxg = @Rot_x_g;
Rotyg = @Rot_y_g;
Rotzg = @Rot_z_g;
Rotxg_d = @Rot_x_gd;
Rotyg_d = @Rot_y_gd;
Rotzg_d = @Rot_z_gd;

end

%%
% TRANSLATION MATRIX
function [T] = tras(t)
% Translation matrix
%   t: displacement vector of shape (3,1)
    [nrows,ncols] = size(t);
    if nrows ~= 3 && ncols ~=1
        error('displacement vector should be of size (3,1)')
    end
    temp = [eye(3) t];
    T = [temp; 0 0 0 1];
end

%%
% FUNCTIONS OF ROTATION MATRICES FOR HOMOGENEOUS TRANSFORMATIONS - RADIANS
function [Rx] = Rot_x_g(theta)
% Rotation matrix around x-axis
%   theta: angle in radians
    temp = [1 0 0; 0 cos(theta) -sin(theta); 0 sin(theta) cos(theta)]; 
    foo = [0; 0; 0];
    temp = [temp foo];
    Rx = [temp; 0 0 0 1];
end

function [Ry] = Rot_y_g(theta)
% Rotation matrix around y-axis
%   theta: angle in radians
    temp = [cos(theta) 0 sin(theta); 0 1 0; -sin(theta) 0 cos(theta)]; 
    foo = [0; 0; 0];
    temp = [temp foo];
    Ry = [temp; 0 0 0 1];
end

function [Rz] = Rot_z_g(theta)
% Rotation matrix around z-axis
%   theta: angle in radians
    temp = [cos(theta) -sin(theta) 0; sin(theta) cos(theta) 0; 0 0 1]; 
    foo = [0; 0; 0];
    temp = [temp foo];
    Rz = [temp; 0 0 0 1];
end

%%
% FUNCTIONS OF ROTATION MATRICES FOR HOMOGENEOUS TRANSFORMATIONS - DEGREES
function [Rx] = Rot_x_gd(theta)
% Rotation matrix around x-axis
%   theta: angle in degrees
    theta = deg2rad(theta);
    temp = [1 0 0; 0 cos(theta) -sin(theta); 0 sin(theta) cos(theta)]; 
    foo = [0; 0; 0];
    temp = [temp foo];
    Rx = [temp; 0 0 0 1];
end

function [Ry] = Rot_y_gd(theta)
% Rotation matrix around y-axis
%   theta: angle in degrees
    theta = deg2rad(theta);
    temp = [cos(theta) 0 sin(theta); 0 1 0; -sin(theta) 0 cos(theta)]; 
    foo = [0; 0; 0];
    temp = [temp foo];
    Ry = [temp; 0 0 0 1];
end

function [Rz] = Rot_z_gd(theta)
% Rotation matrix around z-axis
%   theta: angle in degrees
    theta = deg2rad(theta);
    temp = [cos(theta) -sin(theta) 0; sin(theta) cos(theta) 0; 0 0 1]; 
    foo = [0; 0; 0];
    temp = [temp foo];
    Rz = [temp; 0 0 0 1];
end