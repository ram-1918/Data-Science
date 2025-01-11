function [num]=rbhaviri_pp6(A,i,j,n)
    % To find the Total number of paths from i to j less than length n.
    x=1;             % initialized a variable.
    totlen=0;        % total number of paths of length<=n stores in totlen. 
    while x<=n       % loops until x value exceeds n.
        temp=A^x;    % transition matrix to the power of x is stored in temp variable.
        totlen=totlen+temp(i,j);    % total number of paths is updated here.
        x=x+1;                      % x value is incremented here.
    end
    num=totlen;                      % final value of total number of paths is stored in num.
    %disp(num);
end
