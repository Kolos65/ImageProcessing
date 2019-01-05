function [E] = crop_and_close(I)
    offset = calc_offset(I);
    rect = [offset(2), offset(1), 99, 99];
    slice = imcrop(I, rect);
    SE = strel('disk',1);
    slice = imdilate(slice, SE);
    E = imerode(slice, SE);
end
