function [sxTrain, sxTest, ttmTrain, ttmTest, fxTrainBS, fxTrain, fxTest, deltas] = bsPricing()

% do the procing using Black-Scholes model and return the results
% first we need to get  the pricing from the Black Scholes
% model, which will be our ground truth

% load data
load('Data\prices');
load('Data\dates');
load('Data\stock');

% interest rate is fixed
intRate = 6/100;

% list of strike prices for all the 5 call options
% and 5 put options we have
% note that the strike price is different from the option price
strikePrices = [2925, 3025, 3125, 3225, 3325, ...
    2925, 3025, 3125, 3225, 3325];

% neglect the last week as the timeToExpire (in years) becomes to small
% and the calcuations of volatility gives errors
neglectedDays = 10;

% data is divided to training and testing
n = size(stock,1);
m = length(strikePrices);
nTest = int16(n/4);
nTrain = n - nTest - neglectedDays;

% list of estimated prices of put and call options
estmPrices = zeros(nTrain,m);

% delta values of BS model
deltas = zeros(nTrain,m);

%array for time to maturity
ttmTrain = zeros(nTrain,1);
tMat = dates(nTest+nTrain+1);

% loop on the test data. for each one, calcuate the volatility
% from train data and estimate the call price and save it
for i=1:nTrain
    
    idxCurrent = nTest +i;
    
    % current price of the underlying asset
    stockPrice = stock(idxCurrent);
    
    % time untill the expiration of the option (in years)
    expTime = (tMat - dates(idxCurrent))/252;
    ttmTrain(i) = expTime;
    
    % loop on the 10 options we have (5 call and 5 put)
    for j=1:m
        
        % strike price of the option
        strikePrice = strikePrices(j);
        
        % window of historical prices
        histPrices = prices(i:nTest+i-1, j);
        
        % volatility, this is different than the implied volatility
        sigma = calcVolatility1(histPrices);
        sigmaValues(i,j) = sigma;
        
        % get some parameters of the model
        deltas(i,j) = blsdelta(stockPrice, strikePrice, intRate, expTime, sigma);
        
        % apply the model to get the option price
        [pCall, pPut] = blsprice(stockPrice, strikePrice, intRate, expTime, sigma);
        if (j <= 5)
            estmPrices(i,j) = pCall;
        else
            estmPrices(i,j) = pPut;
        end
    end
    
end

% we normalize the prices to be (c/K, s/K)
% instead of (c, s)
% k : strike price
% c : call price
% s : underlying price

% normalize by dividing by strike price
% normalize the predicted prices as well
sx = zeros(nTrain+nTest,m);
fx = zeros(nTrain+nTest,m);
fxTrainBS = zeros(nTrain,m);
for i=1:m
    sx(:,i) = stock(1:nTest+nTrain)/strikePrices(i);
    fx(:,i) = prices(1:nTrain+nTest,i)/strikePrices(i);
    fxTrainBS(:,i) = estmPrices(:,i)/strikePrices(i);
end

sxTest = sx(1:nTest,:);
sxTrain = sx(nTest+1:end,:);

ttmTest = zeros(nTest,1);
for i=1:nTest
    expTime = (tMat - dates(i))/365;
    ttmTest(i) = expTime;
end

% split the normalized option prices
fxTrain = fx(nTest+1:nTest+nTrain,:);
fxTest = fx(1:nTest,:);

end