clc
close all

data = load("datas/EEGSampleData.mat");
load('datas/Electrodes')
% Adding noise to the data
Noise = data.X_noise_1;
X = data.X_org;
Ps = sum(X.^2,'all');
Pn = sum(Noise.^2,'all');
SNR = -10;
sigma = sqrt(Ps/Pn * 10^(-SNR/10));
X_noisy = X + sigma*Noise;
%% Calculating the components of the ICA
clc
[F,W,K] = COM2R(X_noisy,32);

figure
plotEEG(W*X_noisy, Electrodes)
title("Components of ICA")
%% Denoising Signal by ICA
clc
Z=pinv(F)*X_noisy;
bad_channels = [1:2, 4:32];
Z(bad_channels,:) = Z(bad_channels,:)*0;
X_den_ica = F*Z;

figure
plotEEG(X_den_ica, Electrodes)
title("Denoised signal using ICA")