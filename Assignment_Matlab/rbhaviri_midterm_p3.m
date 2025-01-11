function [v] = rbhaviri_midterm_p3(p,lam,x0,x,id,s)
    % This function returns the interpolated value.
    n=length(x0);       % the size of the vector x0
    total = 0;          % initialize total to 0.
    for i=1:n           % loops 1 through the length of the vector.
        k = p(x0(i,:),x,id,s);         % using function handle for p1 we obtain radial basis.
        total = total + lam(i)*k;      % the lambda value is multipled with radial basis.
    end
    v=total;            % the total obtained is stored in v.
end