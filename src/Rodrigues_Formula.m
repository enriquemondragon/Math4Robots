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
