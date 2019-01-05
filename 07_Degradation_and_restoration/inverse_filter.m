function [R] = inverse_filter(H)
    R = conj(H) ./ (abs(H).^2);
end