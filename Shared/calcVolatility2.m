function [sigma] = calcVolatility2(returns)

% calcuate the volatility from histotical data
% as mentioned in the paper in page 32/40
% sigma = s/sqrt(n), where s is the standard deviation
% of the given prices (should be the  continuously compounded 
% daily returns for last 60 days)
% n should be 60 because the list of returns are for 60 days

n = length(returns);
sigma = std(returns)/sqrt(n);

end