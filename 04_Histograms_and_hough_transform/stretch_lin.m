function output_img = stretch_lin(input_img)
    I = double(input_img);    
    minimum = min(I(:));
    maximum = max(I(:));
    dyn = maximum - minimum;
    
    
    output_img = zeros(size(I));
    
    for i=1:size(I,1)
        for j=1:size(I,2)
            output_img(i,j) = round(255*(I(i,j)-minimum)/dyn);
        end
    end
    
    output_img = uint8(output_img);
end