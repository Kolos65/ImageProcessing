function [LUT, M] = step1_initialization(S, k)
    [m,n] = size(S);
    LUT = zeros(1,m);
    M = zeros(k, n);
    
    step = floor(m/k);
    center_indexes = 1:step:m-1;
    
    for i=1:k
        M(i,:) = S(center_indexes(i),:);
    end
    
end
