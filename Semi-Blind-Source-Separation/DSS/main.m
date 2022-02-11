clc
clear
load data/SampleData.mat
fs = 100;

W = rand(8,1);
tau = 400;
l = length(X_org)/tau;

% whitening
[V,D] = eig(X_org*X_org');
[~,indx] = sort(diag(D), 'descend');
D = flip(D(:,indx));
V = V(:,indx);

B = sqrt(inv(D));
A = V';
Z = B*A*X_org;
while 1
    r = W'*Z;
    r_p = 0;
    for j = 1:l
       r_p = r_p+r(1+(j-1)*tau:(j)*tau); 
    end
    r_p = r_p/l;
    r_pp = repmat(r_p, [1,l]);
    W_p = Z*r_pp';
    W_pp = W_p/sqrt(sum(W_p.^2,'all'));
    if sqrt(sum(abs(W_pp.^2 - W.^2),'all')) < 0.0001
       break 
    end
    W = W_pp;
end

X_den = inv(B*A)*W*r;
X1_err = X1 - X_den;

disp_eeg(X_org, '',fs,'','Measured signals');
disp_eeg(X1, '',fs,'','Main source');
disp_eeg(X_den, '',fs,'','Obtained source using DSS');
disp_eeg(X1_err, '',fs,'','Main source - Obtained source');