%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Question 1-a: simulating Black-Scholes model
%               using the RBF network
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc;

% precition using black-scholes
[sxTrain, sxTest, ttmTrain, ttmTest, cxTrainBS, cxTrain, cxTest, deltas] = bsPricing();

nOption = size(sxTrain,2);
gmm_k = 4;

errorTrainBS = [];
errorTrainRBF = [];
errorTrain = [];
errorTest = [];
errorDelta = [];
cxTrainRBF = [];
cxTestRBF = [];

for i=1:nOption/2
    % construct the desgin matrix
    phiTrain = rbfDesignMatrix([sxTrain(:,i) ttmTrain], gmm_k);
    phiTest = rbfDesignMatrix([sxTest(:,i) ttmTest], gmm_k);
    
    % solve least-squares problem to get the lambda
    % we have ill-conditioned matrix, so instead of using
    % pseudo inverse , use pinv with regularization/tolerance term
    % if you used the pseudo inverse with ill-conditioned matrix,
    % you will get a lambda that's over fitting
    % which will work well for predicting for the training 'cxTrainRBF'
    % but will work utterly wrong in predicting for the test 'cxTestRBF'
    %lambda = phiTrain \ cxTrainBS(:,i);
    lambda = pinv(phiTrain, 0.1) * cxTrain(:,i);
    
    % do the prediction of the RBF
    cxTrainRBF =  [cxTrainRBF, phiTrain * lambda];
    cxTestRBF = [cxTestRBF, phiTest * lambda];
    
    errorTrainBS = [errorTrainBS, cxTrainBS(:,i) - cxTrain(:,i)];
    errorTrain = [errorTrain, cxTrainRBF(:,i) - cxTrain(:,i)];
    errorTrainRBF = [errorTrainRBF, cxTrainRBF(:,i) - cxTrainBS(:,i)];
    errorTest = [errorTest, cxTestRBF(:,i) - cxTest(:,i)];
    
    % estimating delta
    phiDelta = rbfDesignMatrix([deltas(:,i) ttmTrain], gmm_k);
    % use tolerance term for pseudo inverse
    %lambdaDelta = phiDelta \ deltas(:,i);
    lambdaDelta = pinv(phiDelta, 0.01) * deltas(:,i);
    deltasEstm =  phiDelta * lambdaDelta;
    errorDelta = [errorDelta, deltasEstm - deltas(:,i)];
    
%     figure(i);clf;
%     hold on;
%     grid on;
%     box on;
%     plot(ttmTrain, cxTrain(:,i), 'k');
%     plot(ttmTrain, cxTrainBS(:,i), 'r');
%     plot(ttmTrain, cxTrainRBF, 'b');
%     %axis([0, 0.7, -0.04, 0.04]);
%     %plot(ttmTrain, errorTrainRBF(:,i), 'b');
%     %plot(ttmTrain, errorTrain(:,i), 'r');
%     %plot(ttmTrain, cxTrainRBF(:,i), 'r');
end








