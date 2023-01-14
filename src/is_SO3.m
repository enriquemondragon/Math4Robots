% SO(3)
% 3D ROTATION GROUP

function is_SO3(R)
% Test if a matrix belongs to the SO(3) group
%   R: 3x3 Matrix
    RRT = R * transpose(R)
    % Adress floating-point 0-tolerance
    tol = 1.e-6;
    [nrows,ncols] = size(RRT);
    for i =1:nrows
        for j=1:ncols   
            RRT(i,j);
            if abs(RRT(i,j))<=tol
                RRT(i,j)=round(RRT(i,j));
            end
        end
    end
    
    % Floating-point tolerance
    if isdiag(RRT)==1 & ismembertol(diag(RRT), 1, tol) 
        test1 = true;
    else
        test1 = false;
    end
    
    % Floating-point tolerance
    detR = det(R)
    if ismembertol(detR, 1, tol) 
        test2 = true;
    else
        test2 = false;
    end

    if test1 & test2
        fprintf('\t Yes, it belongs to the SO(3) group \n')
        fprintf('\t It meets the conditions: \n')
        fprintf('\t det R = +1 \n \t R*R^T = I \n')
    elseif test1 & ~test2
        fprintf('\t No, it does not belong to the SO(3) group \n')
        fprintf('\t It does not meet the condition: det R = +1 \n')
    elseif ~test1 & test2
        fprintf('\t No, it does not belong to the SO(3) group \n')
        fprintf('\t It does not meet the condition: R*R^T = I \n')
    elseif ~test1 & ~test2
        fprintf('\t No, it does not belong to the SO(3) group \n')
        fprintf('\t It does not meet the conditions: \n')
        fprintf('\t det R = +1 \n \t R*R^T = I \n')
    end
end
