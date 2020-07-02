function residual = ANCR_res(X,y,c,trls)
ClassNum = length(unique(trls));
train_tol = size(X,2);

% construct a sparse matrix
W = sparse([],[],[],train_tol,ClassNum,length(c));

% obtain the coefficients for each class
for j=1:ClassNum
    ind = (j==trls);
    W(ind,j) = c(ind);
end

% calculate class-wise residual
temp = X*W-repmat(y,1,ClassNum);
residual = sqrt(sum(temp.^2));
end