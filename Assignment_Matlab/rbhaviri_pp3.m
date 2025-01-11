function [f]=rbhaviri_pp3(n)
    p=1;                % initializes p value to 1
    i=1;
    if n<0
        disp("factorial takes only positive values")
    else
        while i<=n      % loops n times.
            p=p*i;      % multiplies p value i times.
            i=i+1;
        end
    end
    f=p;
end