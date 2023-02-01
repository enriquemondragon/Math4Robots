% KINETIC ENERGY
% KINETIC ENERGY OF A SYSTEM

function [T] = Kinetic_Energy(m,x,x_diff)
% Computes the kinetic energy of a system T = 1/2 * m * v^2
%   m: Particle's mass 
%   x: Position vector
%   x_diff: Derivarite of position vector w.r.t time (velocity)
    
    if length(x) == 2
        x_norm = simplify(x_diff(1)^2 + x_diff(2)^2)
    elseif length(x) == 3
        x_norm = simplify(x_diff(1)^2 + x_diff(2)^2 + x_diff(3)^2)
    else
        fprintf('\t x should be in 2D (2,1) or 3D (3,1)\n')
        return
    end
    T = 1/2 * m * x_norm     
end
