% Load dataset
data = csvread('cart_abandonment_data.csv', 1, 2);
% skips ID + Is_Product_Details_viewed columns

% Normalize data
mu = mean(data);
sigma = std(data);
norm_data = (data - mu) ./ sigma;

% Covariance matrix
cov_matrix = cov(norm_data);

% Eigen decomposition
[eigen_vectors, eigen_values] = eig(cov_matrix);

% Sort eigenvalues
[eigen_values_sorted, index] = sort(diag(eigen_values), 'descend');
eigen_vectors_sorted = eigen_vectors(:, index);

% Reduce to 2 principal components
k = 2;
reduced_data = norm_data * eigen_vectors_sorted(:, 1:k);

% Plot
scatter(reduced_data(:,1), reduced_data(:,2));
title('PCA on Cart Abandonment Dataset');
xlabel('Principal Component 1');
ylabel('Principal Component 2');
