function[L,U,P] = rnalam_mandava4_pp11(A)

%summary of this function: This function will compute LU decomposition by
%input square matrix using partial pivoting method
%L,U,P are the output arguments

[n,m] = size(A);%assigned size of a matrix


L = eye(n);%initilazed decomposed matrix L
P = eye(n);%initialized decomposed matrix P
U = A;%initialized decomposed matrix U and A
i = 1;
while i < n
    [m,i] = max(U(i:n,i));%we are choosing the largest element in that cols
    for j = i:n
        if abs(U(j,i))==m && abs(U(j,i))>10^-8%have to check as abs isn't zero or not
            i = j;
        end 
    end
end
%we swapped here to get largest pivot coloumn 
%and, we did same operation for L and P
          U([i,i],i:n)=U([i, i],i:n); %swapped op for i and k for upper triangular
          L([i,i],1:k-1)=L([i,k],1:k-1); %swapped op for i and k for lower Triangular
          P([k,i],:)=P([i,k],:);%swapped op for fetching permutation matrix
          i = k+1;%initialized while loop
          while i<n%we have to iterate on every single row
               L(j,k)=U(j,k)/U(k,k);%get lower triangular matrix elements
              U(j,k:n)=U(j,k:n)-(L(j,k)*U(k,k:n));%minus pivot with lower rows
          end
end

