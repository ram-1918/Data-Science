% Using Function handle all the three methods, qr_classical, qr_Modified and
% Householder are imported from the given folder.
classical = @qr_classical;
modified = @qr_modified;
household = @qr_householder;
matlab_qr = @qr;    % Using Function handle Matlab's qr function is called.
x = 0;              % initialize x as 0.
v1 =[];             % vector 1 is initialized.
v2 =[];             % vector 2 is initialized.
v3 =[];             % vector 3 is initialized.
v4 =[];             % vector 4 is initialized.
i = 2;
while i <= 11        %loops through the matrix size (2:11) using FOR loop.
    x = x+1;             %increament x by 1.
    A = hilb(i);         % Using hilbert funtion hilb(i) matrix is stored in A.
    
    % Each method returns Q, R values and those values are stored in [Q1,R1],[Q2,R2]....
    % For each value of Q, Compute the norm of ||Q.'*Q - I || and this value is stored in arrays that are initialized before.
    [Q1, R1] = classical(A);
    v1(x) = norm(Q1.'*Q1 - eye(i));
    [Q2, R2] = modified(A);
    v2(x) = norm(Q2.'*Q2 - eye(i));
    [Q3, R3] = household(A);
    v3(x) = norm(Q3.'*Q3 - eye(i));
    [Q4, R4] = matlab_qr(A);
    v4(x) = norm(Q4.'*Q4 - eye(i));
    i = i + 1;
end

% Using Matlab's semilogy function all the methods namely classical Gram-Schmidt, modified Gram-Schmidt,
% HouseHolders reflectors and matlab's qr are plotted.
plt = semilogy((2:11),v1,':',(2:11),v2,'--',(2:11),v3,'-.',(2:11),v4);
% Results are labelled using matlab's legend.
legend('Classical Gram-Schmidt','Modified Gram-Schmidt','Householder',"Matlab's qr",'Location','northwest')
xlabel ('MATRIX SIZE')
plt(1).LineWidth = 2;
plt(2).LineWidth = 2;
plt(3).LineWidth = 2;
plt(4).LineWidth = 2;
plt(2).Color = [0.4 0 0];
plt(3).Color = [0.1 0 0];
plt(4).Color = [0.7 0.5 0.1];




