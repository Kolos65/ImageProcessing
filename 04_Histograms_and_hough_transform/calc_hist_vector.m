function hist_vector = calc_hist_vector(input_img)
    hist_vector = zeros(256,1);
    IMG = input_img(:);
    for i=1:size(IMG)
        index = IMG(i);
        hist_vector(index+1) = hist_vector(index+1) + 1;
    end
end