function [length]=rbhaviri_pp5(A,i,j)
    % TO find the minimum path length that exists between i and j.
    x=1;                    % x value is initialized.
    while x<=15             % loops untill length < 15.
        temp=A^x;           % transition matrix to the power of x is stored in temp.
        if temp(i,j)==0     % checks if number of paths from i to j is zero.
            x=x+1;          % increments the value of x.
        else            % if number of paths from i to j is not zero, loop breaks and x value is registered.
            break
        end
    end
    if x>15             % if min path length exceeds 15, error function is called.
        error("error");
    else
        length=x;        % else the value of x is stored in length.
    end
end



