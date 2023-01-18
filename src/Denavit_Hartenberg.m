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
