function output_img = myconv(input_img, kernel)
    
    pad_size_x = (size(kernel,1)-1)/2;
    pad_size_y = (size(kernel,2)-1)/2;
    
    input_img_extended = padarray(input_img,[pad_size_x pad_size_y],0,'both');
    
    H = rot90(kernel,2);

    output_img = zeros(size(input_img));
    
    for r = pad_size_x+1 : size(input_img,1) + pad_size_x
        for c = pad_size_y+1 : size(input_img,2) + pad_size_y
             m = input_img_extended(r-pad_size_x:r+pad_size_x,c-pad_size_y:c+pad_size_y) .* H;
             output_img(r-pad_size_x,c-pad_size_y) = sum(m(:));
        end
    end
    
end
