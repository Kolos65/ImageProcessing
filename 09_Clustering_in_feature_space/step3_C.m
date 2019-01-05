function SEG = step3_C(A, I)
% step3: restore the original shape of the image matrix
% versionC: H as feature space (from HSV)
% (do not forget 
% - to insert 0.7s as the missing S and V layers of HSV,
% - and to multiply the array with 255, before converting to uint8)
    h = size(I,1);
    w = size(I,2);
    SEG = reshape(A, h, w, 1);
    SEG(:,:,2:3) = 0.7;
    SEG = hsv2rgb(SEG);
    SEG = SEG .* 255;
    SEG = uint8(SEG);
end
