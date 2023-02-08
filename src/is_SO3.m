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
