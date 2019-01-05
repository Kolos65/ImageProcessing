function CROP = apply_mask_and_crop(IMG, MASK, center)
%    IMG: RGB image in uint8 format (from 0 to 255) 
%   MASK: logical array (only zeros and ones).
%          0 if not card,
%          1 if card
% center: 2-element vector, coordinate of the center of mass
%          center(1) is the horizontal coordinate
%          center(2) is the vertical coordinate
%
% CROP: RGB image in uint8 format (from 0 to 255) showing the cropped card
    
    WHT = uint8(ones(size(IMG)) * 255);
    WHT_masked = WHT .* uint8(~MASK);
    IMG_masked = IMG .* uint8(MASK);
    Masked = WHT_masked + IMG_masked;
    width = 280;
    height = 420;
    crop_window = [center(1)-(width/2), center(2)-(height/2), width, height];
    CROP = imcrop(Masked,crop_window);
end