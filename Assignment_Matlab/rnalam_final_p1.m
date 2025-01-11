function [mu,V] = rnalam_final_p1(f, n)
% This method returns mean of all angles that will be sored in mu and
%  and a co-variance matrix.
    mu = [0;0];
    F=eas501_rand((1500+2500)/2,sqrt(((2500-1500)^2)/(12)),1,n); % force values are generated and stored in F
    E=eas501_rand(200*10^9,10^9,1,n);  % elastic values are generated and stroed in E
    d=eas501_rand(10^-2,2*10^-4,1,n);   % diameter values are generated and stroed in d
    covmatrix=zeros(2,2);              % covarience matrix is initialized

    %from the above generated F,E,d values, running the below code to create the deflection of tip and the angle of deflection of tip
    fhandle = f; % fhandle is the function handle to Beam defelction.
    [deflections_tip_list, angles_tip_list] = fhandle(F,E,d); % the defelction tip list and the angle tip list are produced using the function handle.
    % Using the mentioned lists, calculate the mean for tip deflection and the angle of tip deflection.
    deflections_tip_list_mean=sum(deflections_tip_list)/n;
    angles_tip_list_mean=sum(angles_tip_list)/n;
    %the final mean of the deflection tip list and angle tip list is stored in vector 

    k = 1; 
    % calcuation of covarience matrix goes here
    while k < n
        covmatrix(1,1)=covmatrix(1,1)+(deflections_tip_list(k)-deflections_tip_list_mean)^2;
        covmatrix(1,2)=covmatrix(1,2)+((deflections_tip_list(k)-deflections_tip_list_mean)*(angles_tip_list(k)-angles_tip_list_mean));
        
        covmatrix(2,2)=covmatrix(2,2)+(angles_tip_list(k)-angles_tip_list_mean)^2;
        covmatrix(2,1)=covmatrix(1,2);
        k = k + 1;
    end
    % finally produced covarience matrix is updated by diving the matrix
    % position by n-1.
   covmatrix(1,1)= covmatrix(1,1)/(n-1);
   covmatrix(1,2)= covmatrix(1,2)/(n-1);

   covmatrix(2,2)= covmatrix(2,2)/(n-1);
   covmatrix(2,1)=covmatrix(1,2);   
   
   % the covariance matrix is assigned to V.
   V = covmatrix;
   mu(1)=deflections_tip_list_mean;    % deflection list mean
   mu(2)=angles_tip_list_mean;         % angle list mean
end