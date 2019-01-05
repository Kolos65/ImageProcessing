function [R] = CLS_filter(H, alpha, C)
   R = conj(H) ./ ((abs(H).^2) + alpha * abs(C).^2);
end