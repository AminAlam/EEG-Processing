function W_Filt = CSP(X, labels)


[~, cls1_indexes] = find(labels==0);
[~, cls2_indexes] = find(labels==1);

C_x1 = 0;
for i = cls1_indexes
    C_x1 = C_x1+ X(:,:,i)'*X(:,:,i);
end

C_x2 = 0;
for i = cls2_indexes
    C_x2 = C_x2+ X(:,:,i)'*X(:,:,i);
end


[V,D] = eig(C_x1, C_x2);
D = diag(D);
[D, indx] = sort(D, 'descend');
V = (V(:,indx));
W_Filt = [V(:,1:3), V(:,end-3:end)];


