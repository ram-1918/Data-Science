function [x] = rbhaviri_pp10(f,a,b,tol)
    % Using regula-falsi method, we get the approximate root for function f
    % using the formula - newroot = (a*f(b)-b*f(a))/(f(b)-f(a))
    s = b -(f(b)*(b-a))/(f(b)-f(a));    % find the root for the given a, b and assign to s. 
    while abs(f(s))>tol                 % compare the absolute value of f(s) with given tolerance.
        if f(a)*f(s)<0      % checks if f(a)*f(s) is a negetive number or not 
            b=s;            % if it is a negetive number, update the value of 'b' with 's'.
        else
            a=s;            % if it is a negetive number, update the value of 'a' in every loop with 's'.
        end
        
        s = b -(f(b)*(b-a))/(f(b)-f(a));  % get the new root with new 'a' value.a=s;                            % update the value of 'a' in every loop with 's'.
        
    end 
    x=s;           % when the abs(f(s)) < tol loop breaks and the newroot is stored in x.     
end