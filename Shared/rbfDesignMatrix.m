function [phi] = rbfDesignMatrix(data, k)
%
% fit gaussian mixture model then construct the design matrix
%
% INPUT:
%
% OUTPUT:
%

n = size(data,1);

% fit gaussian mixture model
gmm = fitgmdist(data, k);

% we need to construct the desgin matrix
phi = zeros(n, k + 3);
phi(:, k+1:k+2) = data;
phi(:, k+3) = ones(n,1);
for i=1:n
    for j=1:k
        % get each value of the n columns of the desgin matrix
        % which in our case, the Mahalanobis distance
        % between the data item and the the center of the gmm
        % ?j(x) = [(x ? mj)T ?j(x ? mj)]
        val = data(i,:) - gmm.mu(j,:);
        gmm_sig = gmm.Sigma(:,:,j);
        phi(i,j) = val*gmm_sig*val';
    end
end

end