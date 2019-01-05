function [c] = g1(nn_diff, K)
    c = exp(-(nn_diff./K).^2);
end