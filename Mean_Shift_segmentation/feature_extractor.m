function [ feature_space ] = feature_extractor(image_matrix)
    I = rgb2ycbcr(image_matrix);
    N = size(I,1) * size(I,2);
    feature_space = double(reshape(I,[N,3]));
end