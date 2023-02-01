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