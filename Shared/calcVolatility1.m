function [sigma] = calcVolatility1(prices)

% calcuate the volatility from histotical data
% see the book page 304
% book: Options, Futures and Other Derivatives - 8th Edition

n = length(prices);
u = zeros(n-1, 1);
for i=1:n-1
    u(i) = log(prices(i+1)/prices(i));    
end
u(u==-inf | u==inf | isnan(u)) = 0;
sigma = sqrt((1/(n-2)) * sum((u-mean(u)).^2) );

end