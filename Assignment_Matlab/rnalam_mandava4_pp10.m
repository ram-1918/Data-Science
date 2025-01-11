function[x] = rnalam_mandava4_pp10(f,a,b,tol)
%This function returns single varaible function root value
%as per question we used regular falsi method
%to find root i used function handler
%used 't' as tolorence
x = (a*f(b)-b*f(a))/(f(b)-f(a)); % we used this formalue to calculate the root between a and b, then this will stores at x

t = tol;

while  abs(f(x))>t % we used this to check wether x has one root or the condition of the convergence has been meet or not
    
    if f(a)*f(x)<0 % we used this to check to fetch new root for range
        b = x; % inorder to get new root we changed this range
    else
        a = x;% repeated as above condition, we changed this range
    end
    x = (a*f(b)-b*f(a))/(f(b)-f(a));  % in loop, we used this formalue to calculate the root between a and b, then this will stores at x
    %in the end this fetches the new root and stores to x and returns it

end
end




