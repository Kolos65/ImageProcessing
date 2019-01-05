function A = step2(S, k)
% step2: convert the feature matrix to a clustered/segmented feature matrix
% do here
% - the k-means clustering itself with the built-in matlab function
% - replace the elements of the feature matrix with the centroid values, on
%   the basis of the cluster indices
    [LUT, M] = kmeans(S, k);
    A = M(LUT,:);
end

% solution 2:
% [LUT, M] = kmeans(S, k);
%  for i=1:k
%      j = M(i,:);
%      n = sum(LUT==i);
%      A(LUT == i, :) = j(ones(n,1),:);
%  end