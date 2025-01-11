function [f]=rbhaviri_pp8(L,x,xList,yList)
    % lagrange's interpolating polynomial = sum(y_i*(L_i(x)))
    f_x=0;                  % f_x value is initialized to 0.
    for k=1:length(xList)   % k value loops from 1 through the length of the list.
        f_x=f_x+(yList(k)*L(x,k,xList));     % f_x value is incremented with the interpolating polynomial and L(..) is the previous method that is called using function handle.
    end
    f=f_x;                   % final f_x value is stored in f.
end