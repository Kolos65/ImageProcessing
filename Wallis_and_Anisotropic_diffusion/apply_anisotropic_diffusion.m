function [out_img] = apply_anisotropic_diffusion(in_img, iternum, K, lambda, which_g)
    for i=1:iternum
        [nabla_N, nabla_S, nabla_E, nabla_W] = create_nearest_neighbor_difference_arrays(in_img);
        if which_g == 1
            c_N = g1(abs(nabla_N),K);
            c_S = g1(abs(nabla_S),K);
            c_E = g1(abs(nabla_E),K);
            c_W = g1(abs(nabla_W),K);
        else 
            c_N = g2(abs(nabla_N),K);
            c_S = g2(abs(nabla_S),K);
            c_E = g2(abs(nabla_E),K);
            c_W = g2(abs(nabla_W),K);
        end
        in_img = in_img + lambda*(c_N.*nabla_N + c_S.*nabla_S + c_E.*nabla_E + c_W.*nabla_W);
    end
    out_img = in_img;
end