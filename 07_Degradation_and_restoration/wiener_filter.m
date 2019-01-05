function [R] = wiener_filter(H, P_NN, P_YY)
    R = conj(H) ./ ((abs(H).^2) + (P_NN ./ P_YY));
end