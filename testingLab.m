%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% for testing
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc;

 clear all; close all; 
 %% load datasets
    [lvtest,  test]  = libsvmread('test.krnl');
    [lvtrain, train] = libsvmread('train.krnl');
    [lvvalid, valid] = libsvmread('valid.krnl');
 %% optimize parameter c on validation set
    n = -17:17;
    accuracy = nan(size(n));
    for i=1:numel(n);   % n = {-17,...,17}
        c=2^n(i);       
        % create model
        model = svmtrain(lvtrain, train,['-q -t 4 -c ' num2str(c)]); 
            % option: -t 4 -> precomputed kernel
        [lbl, acc, dec] = svmpredict(lvvalid, valid, model);
        accuracy(i) = acc(1);
    end
    % output the accuracy vs the chosen parameter c
    plot(accuracy);
    xlabel('c'), ylabel('Accuracy'); title('Accuracy vs. c');
 %% test optimal c on the test set
    [~, i] = max(accuracy); % find the best value
    c = 2^n(i);             % this is the optimal c
    % create model
    model = svmtrain(lvtrain, train,['-q -t 4 -c ' num2str(c)]); 
    % test on the testset
    [lbl, acc, dec] = svmpredict(lvtest, test, model, []);
    % show accuracy
    disp(['Accuracy with optimized c (' ...
          num2str(c) ') on Testset: ' num2str(acc(1)) '%']);



