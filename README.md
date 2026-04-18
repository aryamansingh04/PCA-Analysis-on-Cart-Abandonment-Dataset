# 📊 PCA Analysis on Cart Abandonment Dataset

## 📌 Aim
To perform Principal Component Analysis (PCA) on the cart abandonment dataset using GNU Octave and reduce the dimensionality while preserving maximum variance.

---

## 📂 Dataset Description
This dataset contains user session behavior data related to e-commerce activity. It includes features such as:
- Session Activity Count
- Number of Items Added/Removed from Cart
- Number of Page Views
- Login Count
- Customer Segment Type
- Cart Abandonment Status

The dataset is used to analyze patterns influencing cart abandonment.

---

## 🧠 What is PCA?
Principal Component Analysis (PCA) is a dimensionality reduction technique that converts correlated variables into a smaller number of uncorrelated variables called principal components, while retaining most of the variance in the dataset.

---

## ⚙️ Tools Used
- GNU Octave
- CSV Dataset

---

## 🧹 Data Preprocessing
- Removed non-numeric columns:
  - ID
  - Is_Product_Details_viewed
- Normalized the dataset using mean and standard deviation

---

## 💻 PCA Implementation (Octave Code)

```octave
% Load dataset (skip ID and non-numeric column)
data = csvread('cart_abandonment_data.csv', 1, 2);

% Normalize data
mu = mean(data);
sigma = std(data);
norm_data = (data - mu) ./ sigma;

% Compute covariance matrix
cov_matrix = cov(norm_data);

% Eigen decomposition
[eigen_vectors, eigen_values] = eig(cov_matrix);

% Sort eigenvalues in descending order
[eigen_values_sorted, index] = sort(diag(eigen_values), 'descend');
eigen_vectors_sorted = eigen_vectors(:, index);

% Reduce dimensions to 2 principal components
k = 2;
reduced_data = norm_data * eigen_vectors_sorted(:, 1:k);

% Plot PCA result
scatter(reduced_data(:,1), reduced_data(:,2));
title('PCA on Cart Abandonment Dataset');
xlabel('Principal Component 1');
ylabel('Principal Component 2');
```

---

## 📈 Output
- Reduced dataset from multiple features to 2 principal components
- Generated a scatter plot for visualization

