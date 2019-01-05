function [H] = my_hough(input_img)
    % assumption: the input is already a BW image (containing edges) from
    % the range [0, 1]
    max_r = round(sqrt(size(input_img,1)^2+size(input_img,2)^2));
    max_t = 180;
    H = zeros(max_r,max_t);
    
    for i=1:size(input_img,1)
        for j=1:size(input_img,2)
            if input_img(i,j) > 0
                for t=1:180
                    r_t = round(i*cosd(t)+j*sind(t));
                    if r_t > 0 && r_t <= max_r
                        H(r_t,t) =  H(r_t,t) + 1;
                    end
                end
            end
        end
    end
end