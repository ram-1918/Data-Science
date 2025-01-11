function [f] = rbhaviri_pp2(n)
    p=1;           % initializes p to 1.
    if n<0         % if input is a negetive value.
        disp("Factorial takes only positive value")
    else
        for i=1:n      % i values loops through 1 to n.
            p=p*i;     % multiplies p value i times in each iteration.
        end
    end
    f=p;               % assigns p value to f.
end
