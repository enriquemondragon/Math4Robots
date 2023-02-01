% LAGRANGIAN
% NON-RELATIVISTIC LAGRANGIAN FOR A SYSTEM

function [L] = Lagrangian(m,x,x_diff, g)
% Computes the non-relativistic Lagrangian for a system: L = T - V
%   m: Particle's mass 
%   x: Position vector
%   x_diff: Derivarite of position vector w.r.t time (velocity)
%   g: Acceleration due to gravity

    [T] = Kinetic_Energy(m,x,x_diff)
    [V] = Potential_Energy(m, x, g)
    L = T - V
end