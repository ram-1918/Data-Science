function[num] = rnalam_pp6(A,i,j,n)

%concept of this function: this function clearly returns the paths from
%starting point(i) and ending point(j) by the adjacency matrix A for length
sum = 0; % inorder to caalculate length i initialized my sum varaible with 0
for a = 1:n % for given length n this will compute all possible paths from i to j
    abar = A^a;
    temp = abar(i,j);
    sum = sum + temp;
end
num = sum; % in conclusion returning total paths to (n)
end

