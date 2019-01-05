function [local_contrast_img] = compute_local_contrast(in_img, local_mean_img, r)
    local_contrast_img = zeros(size(in_img));
    in_img = padarray(in_img,[r r],'replicate','both');
    local_mean_img = padarray(local_mean_img,[r r],'replicate','both');
    N = (2*r+1)^2;
    for i=1:size(local_contrast_img,1)
        for j=1:size(local_contrast_img,2)
            row = i+r;
            col = j+r;
            local = in_img(row-r:row+r,col-r:col+r);
            local_mean = local_mean_img(row-r:row+r,col-r:col+r);
            local_diff = local - local_mean;
            local_diff_sqrd = local_diff.^2;
            SUM = sum(local_diff_sqrd(:));
            local_contrast_img(i,j) = sqrt(SUM)/N;
        end
    end
end