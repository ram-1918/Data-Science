function [L,scores] = rbhaviri_final_p2(D)
% This function takes data as input and returns Eigen values in decreasing order and PCA scores. 
    rows = size(D, 1);     % Total number of rows of data (D) is stored in rows.
    cols = size(D, 2);     % Total number of columns of data (D) is stored in cols.
    centered_data = zeros(rows, cols);    % Centered data is initalized of size rows X columns.
    covariance_matrix = zeros(cols, cols); % Covarience matrix is initialized of size columns X columns
    mean_of_the_column = sum(D) / rows;   % Mean of each columns is calculated and stored as vector.
    % Given Data is Centered by subtraction each value of the matrix by the mean of the column
    for i = 1:cols         
        centered_data(:, i) = D(:, i) - mean_of_the_column(i);
    end
    % Covariance matrix is created by using the formula -- 
    % (1/n-1)*sum((x - mean)(y - Y)).
    i = 1;
    while i <= cols          % while loop runs for the number of columns.
        j = 1;
        while j <= cols      % inner while loop runs for the number of columns.
            val = dot(centered_data(:,i), centered_data(:,j)); % calculating Covariance between column i, j  and assingning to a variable t. 
            covariance_matrix(i, j) = val/(rows-1);            % The resulted value is divided by (rows-1) and the value updated in the position (i, j).
            j = j + 1;
        end
        i = i + 1;
    end
    [eigenvector, eigenvals] = (eig(covariance_matrix));  % Eigen Vector and Values are produced using eig() function.
    L = sort(diag(eigenvals), 'descend');                 % The diagonal values of produced Eigen values are sorted in decending order in L.
    scores = centered_data * fliplr(eigenvector);  % PCA scores are produced by multiplying centered data and flipped Eigen vector stored in scores.
    
end