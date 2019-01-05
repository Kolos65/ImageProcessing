function [HOG_differences, guilty_index] = pmHOG_findGuilty()
    load ./input/suspects.mat;
    num = size(suspects,3);
    evidence = imread('./input/evidence.png');
    
    HOG_E = pmHOG_extractHOG(evidence);
    HOG_differences = zeros(1,num);
    for i=1:num
        HOG_S = pmHOG_extractHOG(suspects(:,:,i));
        diff = sum(sum(sum(abs(HOG_E-HOG_S))));
        HOG_differences(i) = diff;
    end
    [~,guilty_index] = min(HOG_differences);
end
