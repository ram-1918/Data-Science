function [l]=rbhaviri_pp7(x,i,xList)
    % lagranges formula
    % l_1(x)=((x-x_2)(x-x_3)...(x-x_n))/((x_1-x_2)(x_1-x_3)...(x_1-x_n)).

    numerator=1;     % numerator value is initialized to 1.
    denominator=1;   % denominator is also initialized to 1.
    n=length(xList); % length of the given xList is stored in n.
    for k=1:n           % loops from 1 to n(end of the list).
        if k ~= i       % checks for condition k not equal to i.
            numerator=numerator*(x-xList(k));            % numerator gets updated.
            denominator=denominator*(xList(i)-xList(k)); % denominator gets updated.
        end
    end
    l=numerator/denominator;    % division of numerator and denominator is stored in l as per the formula. 
    
end