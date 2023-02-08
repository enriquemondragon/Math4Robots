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

% CHANGE COORDINATE SYSTEMS
% CARTESIAN, CYLINDRICAL AND SPHERICAL COORDINATES SYSTEMS

function [car2cyl, car2sph, cyl2car, cyl2sph, sph2car, sph2cyl] = Change_CS
% Usage:
%   Call functions as (e.g.): 
%   [car2cyl, car2sph, cyl2car, cyl2sph, sph2car, sph2cyl] = Change_CS
%   car2cyl(x,y,z)

car2cyl = @cartesian_to_cylindrical;
car2sph = @cartesian_to_spherical;
cyl2car = @cylindrical_to_cartesian;
cyl2sph = @cylindrical_to_spherical;
sph2car = @spherical_to_cartesian;
sph2cyl = @spherical_to_cylindrical;
end

% From Cartesian coordinates
function [rho, theta_c, z] = cartesian_to_cylindrical(x,y,z)
% Convert a point from cartesian to cylindrical coordinates
%   Cartesian(x,y,z)
%   Cylindrical(rho, theta_c, z)
    rho = sqrt(x^2 + y^2);
    theta_c = atan2(y,x); 
end

function [r, theta_s, phi] = cartesian_to_spherical(x,y,z)
% Convert a point from cartesian to spherical coordinates
%   Cartesian(x,y,z)
%   Spherical(r, theta_s, phi)
    r = sqrt(x^2 + y^2 + z^2);
    theta_s = acos(z/r);
    phi = atan2(y,x); 
end

% From Cylindrical coordinates
function [x, y, z] = cylindrical_to_cartesian(rho, theta_c, z)
% Convert a point from cylindrical to cartesian coordinates
%   Cylindrical(rho, theta_c, z)
%   Cartesian(x,y,z)
    x = rho * cos(theta_c)
    y = rho * sin(theta_c)
end

function [r, theta_s, phi] = cylindrical_to_spherical(rho, theta_c, z)
% Convert a point from cylindrical to spherical coordinates
%   Cylindrical(rho, theta_c, z)
%   Spherical(r, theta_s, phi)
    r = sqrt(rho^2 + z^2)
    theta_s = atan2(rho,z)
    phi = theta_c
end

% From Spherical coordinates
function [x, y, z] = spherical_to_cartesian(r, theta_s, phi)
% Convert a point from spherical to cartesian coordinates
%   Spherical(r, theta_s, phi)
%   Cartesian(x,y,z)
    x = r * sin(theta_s) * cos(phi)
    y = r * sin(theta_s) * sin(phi)
    z = r * cos(theta_s)
end

function [rho, theta_c, z] = spherical_to_cylindrical(r, theta_s, phi)
% Convert a point from spherical to cylindrical coordinates
%   Spherical(r, theta_s, phi)
%   Cylindrical(rho, theta_c, z)
    rho = r * sin(theta_s)
    theta_c = phi
    z = r * cos(theta)
end
