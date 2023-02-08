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

% POTENTIAL ENERGY
% POTENTIAL ENERGY OF A SYSTEM

function [V] = Potential_Energy(m, x, g)
% Computes the potential energy of a system V = m * g * h
%   m: Particle's mass
%   x: Position vector or directly the h value 
%   g: Acceleration due to gravity

    if nargin < 3
        g = 9.81 % m/s^2
    end
    if length(x) == 2 || length(x) == 3
        h = x(2)
    elseif length(x) == 1
        h = x
    else
        fprintf('\t x should be in 2D (2,1) or 3D (3,1)\n')
        return
    end
    V = m * g * h
end