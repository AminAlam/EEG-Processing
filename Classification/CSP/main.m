clc
clear
load datas/All_data.mat;
fs = 100;
w_filt = CSP(x_train, y_train);

% extracting the indexes of each class in the data
cls1_indexes = find(y_train==0);
cls2_indexes = find(y_train==1);

% before CSP
X = x_train;
plot_time_freq(X, cls1_indexes, cls2_indexes, fs)

% after CSP
X = zeros(size(x_train,1), size(w_filt,2), size(x_train,3));
for i = 1:size(x_train,3)
    X(:,:,i) = (w_filt'*x_train(:,:,i)')';
end
plot_time_freq(X, cls1_indexes, cls2_indexes, fs)