function M = step3_update(S, k, LUT, M)
    for j=1:k
        S_j = S(LUT==j,:);
        M(j,:) = mean(S_j,1);
    end
end
