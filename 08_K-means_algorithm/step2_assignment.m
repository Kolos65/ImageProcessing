function LUT = step2_assignment(S, k, LUT, M)
    m = size(S,1);
    for i=1:m
       d_i = zeros(1,k);
       x_i = S(i,:);
       for j=1:k
            mu_j = M(j,:);
            dist = (x_i-mu_j).^2;
            d_i(j) = sum(dist(:));
       end
       [~,pos] = min(d_i);
       LUT(i) = pos;
    end
end
