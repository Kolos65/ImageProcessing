function [processed_img] = apply_wallis_operator(in_img, local_mean_img, desired_mean, local_contrast_img, desired_contrast, A_max, p)
    processed_img = zeros(size(in_img));
    for i=1:size(processed_img,1)
        for j=1:size(processed_img,2)
            difference = in_img(i,j)-local_mean_img(i,j);
            difference_weight = (desired_contrast*A_max)/(A_max*local_contrast_img(i,j)+desired_contrast);
            difference_weighted = difference * difference_weight;
            desired_mean_weighted = p * desired_mean;
            local_mean_weighted = (1-p) * local_mean_img(i,j);
            local_mean_shifted = desired_mean_weighted + local_mean_weighted;
            processed_img(i,j) = difference_weighted + local_mean_shifted;
        end
    end
    
end