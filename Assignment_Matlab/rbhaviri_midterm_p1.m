function [phi] = rbhaviri_midterm_p1(x,y,id,s)
    % Returns the radial basis between two points x and y.
    switch id           % id here is the radial basis, that switches between the cases depending on the input.
        case 'phs'
            func = @(r,s)(r^(2*s+1));           % creates this function handle for Polyharmonic Splines(phs).
        case 'ga'
            func = @(r,s)(exp(-(s*r)^2));       % creates this function handle for Gaussian. 
        case 'mq'
            func = @(r,s)(sqrt(1+(s*r)^2));     % creates this function handle for Multiquadratic.
        case 'imq'
            func = @(r,s)(1/(sqrt(1+(s*r)^2)));     % creates this function handle for Inverse Multiquadratic.
        otherwise 
            func = @(r,s)(1/(1+(s*r)^2));       % creates this function handle for Inverse Quadratic, but it is taken as otherwise.
    end

    r = norm(x-y);           % finds the norm and using norm func and assign it to r variable.
    
    phi = func(r,s);         % the radial basis is passed to phi.

end