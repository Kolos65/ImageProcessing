function [T] = otsu_th(I, N)
    [hist_vect, bin_centers] = hist(I(:), N);
    hist_vect = hist_vect ./ sum(hist_vect(:));
    sigma_b = zeros(1,N);
    for k=1:N
        omega_1_k = sum(hist_vect(1:k));
        omega_2_k = sum(hist_vect(k+1:N));
        mu_1_k = sum(hist_vect(1:k) .* (1:k)) / omega_1_k;
        mu_2_k = sum(hist_vect(k+1:N) .* (k+1:N)) / omega_2_k;
        sigma_b(k) = omega_1_k * omega_2_k * (mu_1_k - mu_2_k)^2;
    end
    [~, arg_max_sigma_b] = max(sigma_b);
    th = bin_centers(arg_max_sigma_b);
    T = I > th;
end
