%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Question 1-c: simulating Black-Scholes model
%               using the MLP network
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc;

% construct neural network
nn_hidden = 5;
nn = feedforwardnet(nn_hidden);

nOption = size(sxTrain,2);
cxTrainMLP = [];
cxTestMLP = [];
errorTrainMLP = [];
errorTestMLP = [];

for i=1:nOption/2
    
    % prepare the input and target of the network
    nn_train = [sxTrain(:,i) ttmTrain];
    nn_test = [sxTest(:,i) ttmTest];
    nn_target = cxTrain(:,i);
    
    % train the network
    nn = train(nn, nn_train', nn_target');
    %view(nn);
    
    % predict for the train/test sets
    cxTrainMLP = [cxTrainMLP, nn(nn_train')'];
    cxTestMLP = [cxTestMLP, nn(nn_test')'];
    
    % calcuate get the errors
    errorTrainMLP = [errorTrainMLP, cxTrainMLP(:,i) - cxTrain(:,i)];
    errorTestMLP = [errorTestMLP, cxTestMLP(:,i) - cxTest(:,i)];   
end

for i=1:5
    figure(i);clf;
    hold on;
    grid on;
    box on;
    plot([ttmTrain;ttmTest],[cxTrain(:,i);cxTest(:,i)], 'k');
    plot([ttmTrain;ttmTest],[cxTrainMLP(:,i);cxTestMLP(:,i)], 'b');
end
return;







