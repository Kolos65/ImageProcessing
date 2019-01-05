function SEG = pixel_based_segmentation_with_kmeans_B(I, k)
% concatenate step1&2&3
% versionB: RGBXY feature space
    S = step1_B(I);
    A = step2(S, k);
    SEG = step3_B(A, I);
end
