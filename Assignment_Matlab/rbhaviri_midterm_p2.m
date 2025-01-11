function [lam] = rbhaviri_midterm_p2(p,x0,f,id,s)
   m = length(x0);          % stores the length of vector x0 into m.
   val = zeros(m,m);        % Creates zero matrix of size m x m.
   for i=1:m                % Using two for loops to access (i,j) position in the matrix val.
        for j=1:m
            k = p(x0(j,:),x0(i,:),id,s); % Get the radial basis between the points using function handle. 
            val(j,i) = k;   % The radial basis value from function handle is updated to (i,j) position in val matrix.
        end
   end
   c = val\f;
   lam = c;                  % Dot product of inverse of matrix val and vector f is stored in variable lam.
   %saveMyData(id,x0,lam);
end

