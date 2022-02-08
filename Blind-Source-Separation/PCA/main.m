% Loading Sample Data
clc
clear
close all

data = load('datas/SampleData.mat');

scatter3(data.X(1,:), data.X(2,:), data.X(3,:))
title('Sample Data in 3D coordination')
xlabel('x')
ylabel('y')
zlabel('z')
%% Determining PCA comonents of the data
clc
close all
covMat = cov(data.X');
[eigVectors, eigValues] = eig(covMat);
[~,I] = sort(eigValues,'descend');
I = flip(I(1,:));
coeff = eigVectors(:,I);

figure
scatter3(data.X(1,:), data.X(2,:), data.X(3,:))
hold on
plot3([0,coeff(1,1)], [0,coeff(2,1)], [0,coeff(3,1)],'->', 'LineWidth',3)
plot3([0,coeff(1,2)], [0,coeff(2,2)], [0,coeff(3,2)],'->', 'LineWidth',3)
plot3([0,coeff(1,3)], [0,coeff(2,3)], [0,coeff(3,3)],'->', 'LineWidth',3)
legend('Sample Data', 'First Coefficient', 'Second Coefficient', 'Third Coefficient')

xlabel('x')
ylabel('y')
zlabel('z')
%% Whittening data using PCA
clc
close all
X = data.X;
[eigVectors, eigValues] = eig(cov(X'));
[~,indx] = sort(diag(eigValues), 'descend');
eigValues = flip(eigValues(:,indx));
eigVectors = eigVectors(:,indx);

B = sqrt(inv(eigValues));
A = eigVectors';
data_white = B*A*X;

figure
scatter3(X(1,:), X(2,:), X(3,:))
hold on
scatter3(data_white(1,:), data_white(2,:), data_white(3,:))
legend('Sample Data', 'Whittened Data')

xlabel('x')
ylabel('y')
zlabel('z')
%% Loading Sample EEG data
clc
close all
data = load("datas/EEGSampleData.mat");
load('datas/Electrodes')

figure
X = data.X_org;
plotEEG(X, Electrodes)
title('Original Signal')

% Adding noise to the data
clc

Noise = data.X_noise_1;
X = data.X_org;
Ps = sum(X.^2,'all');
Pn = sum(Noise.^2,'all');
SNR = -10;
sigma = sqrt(Ps/Pn * 10^(-SNR/10));
X_noisy = X + sigma*Noise;

figure
plotEEG(X_noisy, Electrodes)
title("Noisy Signal")

[coeff_pca, scores_pca, K_pca] = pca(X_noisy');
figure
plotEEG(scores_pca', Electrodes)
title("Components of PCA")
%% Denoising signal by PCA
coeff_pca_main = coeff_pca;
X_den_pca = coeff_pca_main'*X_noisy;

figure
plotEEG(X_den_pca, Electrodes)
title("Denoised signal using PCA")