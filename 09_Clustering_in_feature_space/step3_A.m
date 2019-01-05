function SEG = step3_A(A, I)
% step3: restore the original shape of the image matrix
% versionA: RGB feature space
    h = size(I,1);
    w = size(I,2);
    SEG = uint8(reshape(A, h, w, 3));
end
