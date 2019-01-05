function [local_mean_img] = compute_local_mean(in_img, r)
    local_mean_img = zeros(size(in_img));
    in_img = padarray(in_img,[r r],'replicate','both');
    N = (2*r+1)^2;
    for i=1:size(local_mean_img,1)
        for j=1:size(local_mean_img,2)
            row = i+r;
            col = j+r;
            local = in_img(row-r:row+r,col-r:col+r);
            SUM = sum(local(:));
            local_mean_img(i,j) = SUM/N;
        end
    end
    
end