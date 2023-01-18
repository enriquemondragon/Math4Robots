% RODRIGUES ROTATION FORMULA
% COMPUTES A ROTATION MATRIX GIVEN AN AXIS AND AN ANGLE OF ROTATION

function [RodriguesRT, RodriguesRT_d] = Rodrigues_Formula
% Usage:
%   Call functions as (e.g.): 
%   [RotZYZ, RotZYZ_d, EulerAngles] = Euler_Angles
%   RotZYZ(phi,theta,psi)

RodriguesRT = @Rodrigues_Rot_Form;
RodriguesRT_d = @Rodrigues_Rot_Form_d;

end

function [e] = Rodrigues_Rot_Form(w, theta)
% Calculates the rotation matrix using the Rodrigues rotation formula
%   w_hat: Skew-symmetric matrix of an angular vector w
%   theta: angle in radians

    I = eye(3)
    w_hat = Skew_Symmetric(w)
    e = I + w_hat*sin(theta) + w_hat^2*(1-cos(theta))
    
end

function [e] = Rodrigues_Rot_Form_d(w, theta)
% Calculates the rotation matrix using the Rodrigues Formula
%   w_hat: Skew-symmetric matrix of an angular vector w
%   theta: angle in degrees

    I = eye(3)
    theta = deg2rad(theta)
    w_hat = Skew_Symmetric(w)
    e = I + w_hat*sin(theta) + w_hat^2*(1-cos(theta))
    
end
