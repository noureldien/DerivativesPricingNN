%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Question 1-c: simulating Black-Scholes model
%               using PPR (Projection Persuit Regression)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc;

%% step 1: run prediction for training

% cxTrainPPR = [];
% errorTrainPPR = [];
% 
% for i=1:5
%     
%     % prepare the input and target of the network  
%     data.X = [sxTrain(:,i) ttmTrain]';
%     data.y = cxTrain(:,i);
%     
%     % since we're using input x with more than one feature
%     % this parameter have an integer root
%     params = 4;
%     
%     % run prediction
%     [ypred,~,~,~] = xtal_modf(data,data,'PPR1',params);
%     cxTrainPPR  = [cxTrainPPR, ypred'];
%     errorTrainPPR = [errorTrainPPR, cxTrainPPR(:,i) - cxTrain(:,i)];
% end
%return;

%% step 2: run prediction for test
% cxTestPPR = [];
% errorTestPPR = [];
% 
% for i=1:5
%     
%     % prepare the input and target of the network
%     trn_data.X = [sxTrain(:,i) ttmTrain]';
%     trn_data.y = cxTrain(:,i);
%     tst_data.X = [sxTest(:,i) ttmTest]';
%     tst_data.y = cxTest(:,i);
%     
%     % since we're using input x with more than one feature
%     % this parameter have an integer root
%     params = 4;
%     
%     % run prediction
%     [ypred,~,~,~] = xtal_modf(trn_data,tst_data,'PPR1',params);
%     cxTestPPR  = [cxTestPPR, ypred'];
%     errorTestPPR = [errorTestPPR, cxTestPPR(:,i) - cxTest(:,i)];
% end
% return;








