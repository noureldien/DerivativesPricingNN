%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Question 1-d: simulating Black-Scholes model
%               using SVR (Support Vector Regression)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc;

%% train the regression SVM (Support Vector Regression)

% -s svm type, 3 for epsilon-SVR
% -t kernel type, 2 for radial basis function
% -c cost parameter C of epsilon-SVR
% -g width parameter gamma for RBF kernel
% -p epsilon for epsilon-SVR
svrParams = {...
    '-s 3 -t 1 -c 20 -q -g 1 -p 0.01';
    '-s 3 -t 2 -c 20 -q -g 2 -p 0.001';
    '-s 3 -t 1 -c 20 -q -g 5 -p 0.01';
    '-s 3 -t 2 -c 20 -q -g 5 -p 0.0001';
    '-s 3 -t 2 -c 20 -q -g 5 -p 0.0001'};

cxTrainSVR = [];
cxTestSVR = [];
errorTrainSVR = [];
errorTestSVR = [];

for i=1:5
    svrModel = libsvmtrain(cxTrain(:,i), [sxTrain(:,i) ttmTrain], svrParams{i});
    svmTrn = libsvmpredict(cxTrain(:,i), [sxTrain(:,i), ttmTrain], svrModel);
    svmTst = libsvmpredict(cxTest(:,i), [sxTest(:,i), ttmTest], svrModel);
    cxTrainSVR = [cxTrainSVR, svmTrn];
    cxTestSVR = [cxTestSVR, svmTst];    
    
    errorTrainSVR = [errorTrainSVR, abs(cxTrainSVR(:,i) - cxTrain(:,i))];
    errorTestSVR = [errorTestSVR, abs(cxTestSVR(:,i) - cxTest(:,i))];    
   
end

return;

%% display the result on the on the graphs
for i=1:5
    
    figure(i);clf;
    subplot(1,2,1);
    hold on; grid on; box on;
    boxplot(errorTrainSVR(:,i));
    subplot(1,2,2);
    hold on; grid on; box on;
    boxplot(errorTestSVR(:,i));
    
    figure(i+5);clf;
    subplot(1,2,1);
    hold on; grid on; box on;
    plot(cxTrain(:,i), 'k');
    plot(cxTrainSVR(:,i), 'r');
    subplot(1,2,2);
    hold on; grid on; box on;
    plot(cxTest(:,i), 'k');
    plot(cxTestSVR(:,i), 'r');
    plot(cxTestMLP(:,i), 'b');
    
end







