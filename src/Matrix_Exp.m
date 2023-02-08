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