function output_img = stretch_log(input_img, c)
    I = double(input_img);
    output_img = zeros(size(I));
    for i=1:size(I,1)
        for j=1:size(I,2)
            output_img(i,j) = round(c*log(I(i,j)+1));
        end
    end 
    output_img = uint8(output_img);
    output_img = stretch_lin(output_img);
end