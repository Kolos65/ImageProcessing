function S = step1_B(I)
% step1: reshape
% versionB: RGBXY feature space
    h = size(I,1);
    w = size(I,2);
    [X,Y] = meshgrid(1:w, 1:h);
    I(:,:,4) = X;
    I(:,:,5) = Y;
    I = double(I);
    S = reshape(I, [], 5);
end
