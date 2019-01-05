function [c] = g2(nn_diff, K)
    c = 1./(1+(nn_diff./K).^2);
end