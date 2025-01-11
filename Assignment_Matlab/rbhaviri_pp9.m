function [val] = rbhaviri_pp9(x,f)
    % Trepzoid rule for uneven intervals is
    % ((x2-x1)*(f1+f2)+(x3-x2)*(f2+f3)+...(xn-xn-1)*(fn+fn+1))/2
    n=length(x);        % get the length of x vector and assign to n.
    t=0;                % assign area to 0.
    for i=1:n-1         % loop through all x and f values until n-1 values.
        t=t+((x(i+1)-x(i))*(f(i)+f(i+1)));  % increment area as per the formula mentioned above.
    end
    val=t/2;             % assign the final value to val.
end

