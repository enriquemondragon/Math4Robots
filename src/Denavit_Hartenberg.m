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

% DENAVIT-HARTENBERG MATRIX
% DENAVIT-HARTENBERG HOMOGENEOUS TRANSFORMATION MATRIX

function [DH_HT] = Denavit_Hartenberg(d, theta, a, alpha)
% Denavit-Hartenberg matrix
%   Denavit–Hartenberg parameters:
%   d: link offset
%   theta: joint angle (radians)
%   a: link length
%   alpha: link twist (radians)

%   DH_HT: Denavit-Hartenberg homogeneous transformation matrix

    RotZ = [cos(theta) -sin(theta) 0 0;
            sin(theta)  cos(theta) 0 0;
            0           0          1 0;
            0           0          0 1];
        
    TransZ = [1 0 0 0;
              0 1 0 0;
              0 0 1 d;
              0 0 0 1];
    
    RotX = [1 0           0          0;
            0 cos(alpha) -sin(alpha) 0;
            0 sin(alpha)  cos(alpha) 0;
            0 0           0          1];
        
    TransX = [1 0 0 a;
              0 1 0 0;
              0 0 1 0;
              0 0 0 1];
    
    DH_HT = RotZ * TransZ * RotX * TransX;
    
end
