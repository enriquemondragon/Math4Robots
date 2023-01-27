% RODRIGUES ROTATION FORMULA
% COMPUTES A ROTATION MATRIX GIVEN AN AXIS AND AN ANGLE OF ROTATION

function [RodriguesRT, RodriguesRT_d] = Rodrigues_Formula
% Usage:
%   Call functions as (e.g.): 
%   [RodriguesRT, RodriguesRT_d] = Rodrigues_Formula
%   [e] = Rodrigues_Rot_Form(w, theta)

RodriguesRT = @Rodrigues_Rot_Form;
RodriguesRT_d = @Rodrigues_Rot_Form_d;

end

function [e] = Rodrigues_Rot_Form(w, theta)
% Calculates the rotation matrix using the Rodrigues rotation formula
%   w: axis of size (3,1)
%   theta: angle in radians

    I = eye(3)
    w_hat = Skew_Symmetric(w)
    e = I + w_hat*sin(theta) + w_hat^2*(1-cos(theta))
    
end

function [e] = Rodrigues_Rot_Form_d(w, theta)
% Calculates the rotation matrix using the Rodrigues Formula
%   w: axis of size (3,1)
%   theta: angle in degrees

    I = eye(3)
    theta = deg2rad(theta)
    w_hat = Skew_Symmetric(w)
    e = I + w_hat*sin(theta) + w_hat^2*(1-cos(theta))
    
end
