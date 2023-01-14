% SKEW-SYMMETRIC MATRIX
% SKEW-SYMMETRIC (ANTISYMMETRIC) MATRIX FOR ANGULAR VELOCITY REPRESENTATION

skew_sym(w)
function [w_cap] = skew_sym(w)
% Generate the skew-symmetric matrix from an angular velocity vector
%   w: angular velocity vector of size (3,1)
%   w_cap: corresponding skew-symmetric matrix of w
    if length(w) ~= 3
        error('angular velocity vector should be of size (3,1)')
    end
    wx = w(1,1)
    wy = w(2,1)
    wz = w(3,1)
    w_cap = [0 -wz wy; wz 0 -wx; -wy wx 0]
end