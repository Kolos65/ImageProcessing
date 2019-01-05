function S = step1_C(I)
% step1: reshape
% versionC: H as feature space (from HSV)
    I = rgb2hsv(I);
    I = I(:,:,1);
    S = reshape(I, [], 1);
end
