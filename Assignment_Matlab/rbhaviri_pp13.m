function [l,v] = rbhaviri_pp13(A,v0)
% Using the  Rayleigh-Quotient Approach, this matlab function returns the Eigen value and Eigen vector.

tolerance = 10 ^ (-8);              % Initializing tolerance with 10 power of (-8).
i = 1;                              % Initializing i = 1 
m = size(A,1);
n = size(A,2);                      % Size of A (given SQUARE MATRIX) is assigned to m, n.
vinit_norm = v0 / norm(v0);                % Using norm function v0 is Normalize.
l0 = transpose(vinit_norm) * A * vinit_norm;  % Finding lambda by multipying transpose of normalized inital vectoe and  A

while true                         % while loop runs for all true values
    if(i < tolerance)              % If condition is used to check if i value is less than tolerance.
        break
    end
    mat = (A - l0 * eye(m,n));
    v_ = (mat \ vinit_norm);           % Returning a matrix with diagonal members using the eye function
    v_ = v_ / norm(v_);                % unit vector is calculated and assiged to variable v_
    vinit_norm = v_;                   % unit vector is calculated and assiged to variable vinit_norm
    l1 = transpose(v_) * A * v_;       % v_ is transposed and multiplied by A and v_.
    i = abs( (l1 - l0) /  l1 );        % Absolute value of l1 is found using abs(). 
    l0 = l1;                           % eigenvalue is calculated and l1 value is assigned to l0.
end
l = l0;            % Eigen Value is returned
v = vinit_norm;    % Eigen Vector is returned
end
