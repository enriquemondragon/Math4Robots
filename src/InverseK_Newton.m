% INVERSE KINEMATICS  - NUMERIC SOLUTION
% NEWTON-RAPHSON METHOD

function [Qvalues] = InverseK_Newton(F,x_d, q, epsilon, max_iter, verify)
% Numerical Inverse Kinematics Algorithm: Newton's Method
%   F: Forward kinematics function f(q) (symbolic)
%   x_d: Desired position in the Cartesian space - 2D(2,1) & 3D(3,1)
%   q: Joint variables of the initial position in the Joint space (n_q,1)
%   epsion: Tolerance for Newton-Rapshon method (Optional)
%   max_iter: Maximum iterations for Newton-Rapshon method (Optional)
%   verify: Verify the results by substituiting them into F (optional)

%   Newton Method = x_(k+1) = x_k - f(x_k)/f'(x_k)
%   q_(k+1) = q_k + J^-1 * (q_k) * (x_d - f(q))
%   q_(k+1): New q values
%   q_k : Current q values
%   J: Jacobian
%   x_d: Desired position in the Cartesian space
%   f(q): Forward kinematics function

    if nargin < 4
        epsilon = 1e-3;
        max_iter = 100;
        verify = true
    end
    
    qs = symvar(F);
    fprintf('\n\t Calculating:\n')
    fprintf('\t Jacobian w.r.t. %s \n', qs)
    J = jacobian(F,qs);
    fprintf('\n\t Size of the Jacobian matrix %s \n',  mat2str(size(J)))
    if length(x_d) ~= length(q)
        % Moore-Penrose inverse: J^+
        fprintf('\n\t Jacobian matrix is not square -->')
        fprintf(' Computing Moore-Penrose inverse \n')
        J_inv = simplify(transpose(J)*(J*transpose(J))^-1);
    else
        J_inv = simplify(inv(J));
    end
    
    for i=1:max_iter
        % Extract q values
        for j=1:length(q)
            temp = qs(j);
            eval(sprintf('%s = %g',temp,q(j)));
        end
        Jinv = eval(J_inv);
        f = eval(F);
        e = x_d-f;
        q = q + Jinv*e;
        if (norm(e)<epsilon)
            break;
        end
    end
    Qvalues = q
    % Verification
    if verify
        for j=1:length(q)
            temp = qs(j);
            eval(sprintf('%s = %g',temp,q(j)));
        end
        comp = eval(F)
    end
    
end
