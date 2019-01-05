function SEG = step3_B(A, I)
% step3: restore the original shape of the image matrix
% versionB: RGBXY feature space
    h = size(I,1);
    w = size(I,2);
    SEG = uint8(reshape(A, h, w, 5));
    SEG = SEG(:,:,1:3);
end
