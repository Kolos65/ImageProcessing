function [nabla_N, nabla_S, nabla_E, nabla_W] = create_nearest_neighbor_difference_arrays(I)
    I_padded = padarray(I,[1 1],'replicate','both');
    N_shifted = I_padded(1:size(I_padded,1)-2, 2:size(I_padded,2)-1);
    nabla_N = N_shifted-I;
    S_shifted = I_padded(3:size(I_padded,1), 2:size(I_padded,2)-1);
    nabla_S = S_shifted-I;
    E_shifted = I_padded(2:size(I_padded,1)-1, 3:size(I_padded,2));
    nabla_E = E_shifted-I;
    W_shifted = I_padded(2:size(I_padded,1)-1, 1:size(I_padded,2)-2);
    nabla_W = W_shifted-I;
end