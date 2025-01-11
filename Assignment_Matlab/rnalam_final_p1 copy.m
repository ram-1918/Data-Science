function [mu,V] = rnalam_final_p1(f, n)
%summary: This function here calculates the means of angle and deflection 
%         also calculates the variance of deflections using the
%         monte-carlo method.
    
    %using the "normrnd" function to randomly generate "n" values for
    %Force,Elastic modulus and diameter in their respective distribution
    F=eas501_rand(1500,sqrt(((2500-1500)^2)/(12),1,n);
    E=eas501_rand(200*10^9,10^9,1,n);
    d=eas501_rand(10^-2,2*10^-4,1,n);
    
    %calling the below function to generate the defelection of tip and the angle
    %of the deflection of tip from the above randomly generated F,E,d values
    fhandle = f;
    [deflections_tip_list, angles_tip_list] = fhandle(F,E,d);
    
    %calculating the mean for defelection of tip and the angle
    %of the defleection of tip from the above lists
    deflections_tip_list_mean=sum(deflections_tip_list)/n;
    angles_tip_list=sum(angles_tip_list)/n;
    
    %returning the above calculated means as a 2 X 1 vector in "mu"
    mu = [0;0];
    mu(1)=deflections_tip_list_mean; %this is deflection mean
    mu(2)=angles_tip_list;   %this is the angle mean
    
    %creating an empty matrix of size 2 X 2
    covmatrix=zeros(2,2);
    
    %using the "monte-carlo method" to calculate the covariance matrix
    k = 0;
    while k < n
        covmatrix(1,1)=covmatrix(1,1)+(deflections_tip_list(i)-deflections_tip_list_mean)^2;
        covmatrix(1,2)=covmatrix(1,2)+((deflections_tip_list(i)-deflections_tip_list_mean)*(angles_tip_list(i)-angles_tip_list));
        
        covmatrix(2,2)=covmatrix(2,2)+(angles_tip_list(i)-angles_tip_list)^2;
        covmatrix(2,1)=covmatrix(1,2);
        k = k + 1;
    end
    
       covmatrix(1,1)= covmatrix(1,1)/(n-1);
       covmatrix(1,2)= covmatrix(1,2)/(n-1);
       covmatrix(2,1)=covmatrix(1,2);        %covariance[i,j]=covariance[j,i]
       covmatrix(2,2)= covmatrix(2,2)/(n-1);
       
       %returning the covariance matrix in variable V
       V=covmatrix;
    
end

