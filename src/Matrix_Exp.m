% MATRIX EXPONENTIAL
% SOLUTION OF TIME DERIVATIVE OF ROTATION MATRICES

function [e_wt] = Matrix_Exp(w, w_hat,t)
% Generate the skew-symmetric matrix from an angular velocity vector
%   w: angular velocity vector of size (3,1)
%   w_hat: corresponding skew-symmetric matrix of w. [Skew_Symmetric.m]
%   t: time to evaluate
%   e_wt: sol. of time derivative of a rotation matrix i.e. R = e^(w_hat*t)
    if length(w) ~= 3
        error('angular velocity vector should be of size (3,1)')
    end
    I = eye(3)
    e_wt = I + sin(norm(w)*t)/norm(w)*w_hat + ...
        ((1-cos(norm(w)*t))/norm(w)^2)*w_hat^2
end