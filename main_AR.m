clear
clc
close all

%data loading (here we use the AR dataset as an example)
load('AR_DAT.mat');

% -------------------------------------------------------------------------
% parameter setting
par.nClass        =   length(unique(trainlabels)); % the number of classes in the subset of AR database
dim = [54 120 300];
param = [];
param.lambda = 1e-4;
param.mu= 1e-2;

% data and labels for training and test samples
%--------------------------------------------------------------------------
Tr_DAT   =   double(NewTrain_DAT(:,trainlabels<=par.nClass));
trls     =   trainlabels(trainlabels<=par.nClass);
Tt_DAT   =   double(NewTest_DAT(:,testlabels<=par.nClass));
ttls     =   testlabels(testlabels<=par.nClass);
clear NewTest_DAT NewTrain_DAT testlabels trainlabels

train_tol= size(Tr_DAT,2);
test_tol = size(Tt_DAT,2);
ClassNum = par.nClass;
%--------------------------------------------------------------------------
reg_rate = zeros(1,length(dim));
kk = 1;
for eigen_num=dim
    %eigenface extracting
    [disc_set,disc_value,Mean_Image]  =  Eigenface_f(Tr_DAT,eigen_num);
    tr_dat  =  disc_set'*Tr_DAT;
    tt_dat  =  disc_set'*Tt_DAT;
    
    % normalize to unit L2 norm
    tr_dat = normc(tr_dat);
    tt_dat = normc(tt_dat);
    
    ID = zeros(1,test_tol);
    X = tr_dat;
    
    % pre-computation
    XTX = X'*X;
    temp_X = pinv(XTX+(param.mu+2*param.lambda)/2*eye(size(XTX)));
    
    for i=1:test_tol
        y = tt_dat(:,i);
        % coding
        [z,c] = ANCR(X, temp_X, y, param);
        
        % classification
        residual = ANCR_res(X,y,c,trls);
        [~,index]=min(residual);
        ID(i)=index;
    end
    
    %-------------------------------------------------------------------------
    cornum      =   sum(ID==ttls);
    reg_rate(kk)         =   cornum/length(ttls); % recognition rate
    kk = kk+1;
end

% output recognition result
disp([dim;reg_rate])