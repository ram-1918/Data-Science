function [mu, V] = rbhaviri_final_p1(f, n)
% This Function returns the sample mean for deflection and sample mean for
% angle in the form of 2 x 1 vector and also returns covariance matrix between deflection and angle.
    cov_mat = [0, 0; 0, 0];               % Covariance Matrix is initialized. 
    i = 1;                                % Variable i is initialized which is used in loop for Cov Matrix
    force_mean = (1500 + 2500)/2;           % Mean for uniform distribution is (a + b)/2 and it is calculated for given force 1500 N, 2500 N.
    force_sd = sqrt(((2500 - 1500)^2)/12);  % Standard Deviation for uniform distribution is ((b-a)/12)^0.5 and it is calculated for given force 1500 N, 2500 N.
    elastic_mean = 200*10^9;       % The given Mean for Elastic Modulus is assigned to a variable.
    elastic_sd = 10^9;             % The given Standard Deviation for Elastic Modulus is assigned to a variable.
    diameter_mean = 10^(-2);       % The given Mean for Diameter of Beam is assigned to a variable.
    diameter_sd = 2*10^(-4);       % The given Standard Deviation for Diameter of Beam is assigned to a variable.
    
    force = eas501_rand(force_mean, force_sd, 1, n);           % Using Function Handle, Mean and Standard Deviation the matrix for Force of size 1 x n is produced.
    elastic = eas501_rand(elastic_mean, elastic_sd, 1, n);     % Using Function Handle, Mean and Standard Deviation the matrix for Elastic Modulus of size 1 x n is produced.
    diameter = eas501_rand(diameter_mean, diameter_sd, 1, n);  % Using Function Handle, Mean and Standard Deviation the matrix for Diameter of beam of size 1 x n is produced.
    
    % Using Beam_Deflection function handle which takes force, elastic and diameter as arguments which returns deflection of the tip and angle of deflection of the tip.

    [deflection, angle] = f(force,elastic, diameter);    
    deflection_mean = sum(deflection)/n;    % The Mean value of Deflection of the tip.  
    angle_mean = sum(angle)/n;              % The Mean value for Angle of tip.
    
    
   % MONTE-CARLO method is implemented here.
   % In every Iteration the Covariance Matrix is Updated.
    while i < n
        centered_deflection = deflection(i) - deflection_mean;    % Deflection is centered about mean.
        centered_angle = angle(i) - angle_mean;                   % Angle is centered about mean.

        cov_mat(1,1) = cov_mat(1,1) + (centered_deflection)^2;                    % (1, 1) position of covariance matrix is updated.
        cov_mat(1,2) = cov_mat(1,2) + (centered_deflection * (centered_angle));   % (1, 2) position of covariance matrix is updated.
        cov_mat(2,1) = cov_mat(1,2);                                              % (2, 1) position of covariance matrix is updated.
        cov_mat(2,2) = cov_mat(2,2) + (centered_angle)^2;                         % (2, 2) position of covariance matrix is updated.

        i = i + 1;     % i value is incremented.
    end
    
    cov_mat(1,1) = cov_mat(1,1)/(n-1);  % (1, 1) position of covariance matrix is updated with the mean value of the (1,1) position.
    cov_mat(1,2) = cov_mat(1,2)/(n-1);  % (1, 2) position of covariance matrix is updated with the mean value of the (1,2) position.
    cov_mat(2,1) = cov_mat(1,2);        % (2, 1) position of covariance matrix is updated with the mean value of the (1,2) position.
    cov_mat(2,2) = cov_mat(2,2)/(n-1);  % (2, 2) position of covariance matrix is updated with the mean value of the (2,2) position.

    mu = [deflection_mean; angle_mean]; % Deflection Mean and Angle Mean is stored in variable mu.
    V = cov_mat;                        % The resultant covariance matrix is stored in variable V.
end

