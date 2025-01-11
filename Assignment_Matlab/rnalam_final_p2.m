function [L,scores] = rnalam_final_p2(D)
% This method returns pca scres and eigen vector values in the largst to
% smallest format and it takes input data and below is how code runs.
    data = D; % the given data is stored in variable data
    data_size = size(data);  % data size is stored in variable data_size
    Number_of_rows = data_size(1);
    Number_of_cols = data_size(2);
    mean = sum(data) / Number_of_rows;  % Mean of the data is calculated.
    covmatrix = zeros(Number_of_cols); % covarience matrix is initialized.
    c_data = zeros(Number_of_rows, Number_of_cols); % normalized data is initialized.
    % Normalization goes here.
    for i = 1:Number_of_cols
        for j = 1:Number_of_rows
            c_data(j,i) = data(j,i)-mean(i); % Mean is neglected from each value of the given data matrix.
        end
    end

    temp = 0;
    % Covarience matrix is updated here using dot product and 
    for i = 1 : Number_of_cols
        for j = 1 : Number_of_cols
            temp = temp +  dot(c_data(:,i),c_data(:,j));
            covmatrix(i,j) = temp;
        temp = 0;
        end
    end
    covmatrix = covmatrix/(Number_of_rows-1);  % Finally obtained Covariece matrix is divied by n-1
    [eigenvector, eigenvals]=eig(covmatrix);  % the resultant matrix is used to et eien values and eigen vectors
    scores = c_data * fliplr(eigenvector);  % scores which are nothing but pca scores is updated using product of both normalized data and eigen vector. 
    L = sort(diag(eigenvals),'descend');    % eigen values are sorted and assigne to L.
end







