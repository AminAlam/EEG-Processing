clc
clear
load data/SampleData.mat
fs = 100;

sigg = X_org;
C = sigg*sigg';
% period of the triangular singnals
tau = 400;
% calulating covariance matrix
C_bar = sigg(:,tau+1:end)*sigg(:,1:end-tau)';
% making covariance matrix symmetric
C_bar = C_bar+C_bar';

[V,D] = eig(C_bar, C);

D = diag(D);
[D, indx] = sort(D, 'descend');
V = (V(:,indx));
W = V(:,1);

S1 = W'*X_org;
sources = zeros(8, 10000);
sources(1,:) = S1;
X_den = (inv(V'))*sources;

X1_err = X1 - X_den;

disp_eeg(X_org, '',fs,'','Measured signals');
disp_eeg(X1, '',fs,'','Main source');
disp_eeg(X_den, '',fs,'','Obtained source using GEVD');
disp_eeg(X1_err, '',fs,'','Main source - Obtained source');