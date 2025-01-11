function [L, U, P] = rbhaviri_pp11(A)
% This function computes the LU decomposition of A with partial pivoting.
n = size(A,1);              % size of Matrix A is stored in n.
U=A;                        % Upper triangular matrix is initialized with A.
L=eye(n);                   % Lower Trinagular matrix is initialized with identity matrix using eye().
P=eye(n);                   % Pivot matrix is initialized.

for k = 1:n
    v = U(k:n,k);            % Gets all the values from rows k to n in the kth column.
    [~,x] = max(abs(v));     % maximum of all values is stored in x
    x = x+(k-1);             % x is incremented (k-1) times.
    if x ~= k                % checks if x not equal to k
        P([x,k],:) =  P([k,x], :); % rows swapped 
        U([x,k],:) =  U([k,x], :); % rows of upper triangular matrix are swaped with the updated values
        if k >= 1  
            L([x,k],1:k-1) =  L([k,x], 1:k-1);     % rows of Lower triangular matrix are swapped
        end
    end
    for i = k+1:n      
        % L(i, k) = U(i, k) / U(i, i) 
        L(i, k) = U(i, k) / U(k, k);                % Lower triangular matrix is updated
        U(i, k:n) =  U(i, k:n) - L(i, k)*U(k, k:n); % Upper triangular matrix is updated
    end
end
