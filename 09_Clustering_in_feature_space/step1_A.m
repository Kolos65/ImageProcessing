function S = step1_A(I)
% step1: reshape
% versionA: RGB feature space
    MAT = double(I);
    h = size(MAT,1);
    w = size(MAT,2);
    d = size(MAT,3);
    S = reshape(MAT, h*w, d);
end
