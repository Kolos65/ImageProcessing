function [out_image] = reshape_spaces(the_space, image_size)

    if size(the_space,2) == 3
        out_image = reshape(the_space,image_size);
        out_image = ycbcr2rgb(uint8(out_image));
    else
        image_size = [image_size(1), image_size(2)];
        out_image = reshape(the_space,image_size);
        out_image = mat2gray(uint8(out_image));
    end
end